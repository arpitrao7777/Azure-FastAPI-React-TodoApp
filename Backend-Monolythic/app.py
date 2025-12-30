from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import pyodbc

# -------------------------------------------------
# DATABASE CONNECTION STRING (AS IS)
# -------------------------------------------------
connection_string = (
    "Driver={ODBC Driver 18 for SQL Server};"
    "Server=tcp:test32971.database.windows.net,1433;"
    "Database=testerdb1;"
    "Uid=mysqladmin;"
    "Pwd=SecureP@ssw0rd!;"
    "Encrypt=yes;"
    "TrustServerCertificate=no;"
    "Connection Timeout=30;"
)

# -------------------------------------------------
# FASTAPI APP
# -------------------------------------------------
app = FastAPI(title="PyTodoBackendMonolith")

# -------------------------------------------------
# CORS
# -------------------------------------------------
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# -------------------------------------------------
# DATABASE CONNECTION
# -------------------------------------------------
def get_connection():
    return pyodbc.connect(connection_string)

# -------------------------------------------------
# CREATE TABLE (WITH DESCRIPTION)
# -------------------------------------------------
def create_tasks_table():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
    IF NOT EXISTS (
        SELECT * FROM sysobjects WHERE name='tasks' AND xtype='U'
    )
    CREATE TABLE tasks (
        id INT IDENTITY(1,1) PRIMARY KEY,
        title NVARCHAR(255) NOT NULL,
        description NVARCHAR(MAX),
        completed BIT DEFAULT 0
    )
    """)

    conn.commit()
    cursor.close()
    conn.close()

# -------------------------------------------------
# RUN ON STARTUP
# -------------------------------------------------
@app.on_event("startup")
def startup_event():
    create_tasks_table()

# -------------------------------------------------
# DATA MODEL
# -------------------------------------------------
class Task(BaseModel):
    title: str
    description: str | None = None
    completed: bool = False

# -------------------------------------------------
# API ENDPOINTS
# -------------------------------------------------

@app.get("/api/tasks")
def get_tasks():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT id, title, description, completed FROM tasks")
    rows = cursor.fetchall()

    tasks = []
    for row in rows:
        tasks.append({
            "id": row.id,
            "title": row.title,
            "description": row.description,
            "completed": bool(row.completed)
        })

    cursor.close()
    conn.close()
    return tasks


@app.post("/api/tasks")
def create_task(task: Task):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(
        "INSERT INTO tasks (title, description, completed) VALUES (?, ?, ?)",
        task.title,
        task.description,
        task.completed
    )

    conn.commit()
    cursor.close()
    conn.close()

    return {"message": "Task created successfully"}


@app.put("/api/tasks/{task_id}")
def update_task(task_id: int, task: Task):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(
        """
        UPDATE tasks
        SET title = ?, description = ?, completed = ?
        WHERE id = ?
        """,
        task.title,
        task.description,
        task.completed,
        task_id
    )

    if cursor.rowcount == 0:
        cursor.close()
        conn.close()
        raise HTTPException(status_code=404, detail="Task not found")

    conn.commit()
    cursor.close()
    conn.close()

    return {"message": "Task updated successfully"}


@app.delete("/api/tasks/{task_id}")
def delete_task(task_id: int):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("DELETE FROM tasks WHERE id = ?", task_id)

    if cursor.rowcount == 0:
        cursor.close()
        conn.close()
        raise HTTPException(status_code=404, detail="Task not found")

    conn.commit()
    cursor.close()
    conn.close()

    return {"message": "Task deleted successfully"}
