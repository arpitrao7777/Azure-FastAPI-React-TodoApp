import React, { useState, useEffect } from 'react';
import axios from 'axios';
import {
  Button,
  TextField,
  Container,
  Typography,
  Card,
  CardContent,
  IconButton,
  Box
} from '@mui/material';
import { Delete } from '@mui/icons-material';

/**
 * Backend API base URL
 * Backend exposes: /api/tasks
 */
const API_BASE_URL = 'http://20.54.82.199:8000/api';

const backgroundImage = process.env.PUBLIC_URL + '/background.jpg';

function TodoApp() {
  const [tasks, setTasks] = useState([]);
  const [newTask, setNewTask] = useState({
    title: '',
    description: ''
  });

  // Fetch all tasks
  const fetchTasks = async () => {
    try {
      const response = await axios.get(`${API_BASE_URL}/tasks`);
      setTasks(response.data);
    } catch (error) {
      console.error('Error fetching tasks:', error);
    }
  };

  // Create a new task
  const createTask = async () => {
    if (!newTask.title.trim()) return;

    try {
      await axios.post(`${API_BASE_URL}/tasks`, {
        title: newTask.title,
        description: newTask.description
      });

      // Refresh task list after creation
      fetchTasks();

      // Reset input fields
      setNewTask({ title: '', description: '' });
    } catch (error) {
      console.error('Error creating task:', error);
    }
  };

  // Delete task
  const deleteTask = async (taskId) => {
    try {
      await axios.delete(`${API_BASE_URL}/tasks/${taskId}`);
      fetchTasks();
    } catch (error) {
      console.error('Error deleting task:', error);
    }
  };

  // Load tasks on component mount
  useEffect(() => {
    fetchTasks();
  }, []);

  return (
    <Box
      sx={{
        backgroundImage: `url(${backgroundImage})`,
        backgroundSize: 'cover',
        backgroundRepeat: 'no-repeat',
        backgroundAttachment: 'fixed',
        minHeight: '100vh',
        paddingTop: '20px'
      }}
    >
      <Container maxWidth="sm">
        <Typography
          variant="h3"
          gutterBottom
          sx={{ textAlign: 'center', color: 'white', mb: 3 }}
        >
          <img src="/collegesmatelogo.png" alt="Logo" style={{ width: '80px' }} />
          <br />
          ToDo App
        </Typography>

        {/* Add Task Section */}
        <TextField
          label="Title"
          variant="outlined"
          fullWidth
          margin="normal"
          value={newTask.title}
          onChange={(e) => setNewTask({ ...newTask, title: e.target.value })}
          InputProps={{ style: { color: 'white' } }}
          InputLabelProps={{ style: { color: 'white' } }}
        />

        <TextField
          label="Description"
          variant="outlined"
          fullWidth
          multiline
          rows={3}
          margin="normal"
          value={newTask.description}
          onChange={(e) => setNewTask({ ...newTask, description: e.target.value })}
          InputProps={{ style: { color: 'white' } }}
          InputLabelProps={{ style: { color: 'white' } }}
        />

        <Button
          variant="contained"
          color="primary"
          fullWidth
          sx={{ mt: 2, mb: 4 }}
          onClick={createTask}
        >
          Add Task
        </Button>

        {/* Task List */}
        <Typography
          variant="h4"
          gutterBottom
          sx={{ textAlign: 'center', color: 'white', mb: 2 }}
        >
          Existing Tasks
        </Typography>

        {tasks.map((task) => (
          <Box key={task.id} mb={2}>
            <Card>
              <CardContent>
                <Typography variant="h6">{task.title}</Typography>
                <Typography variant="body2" color="text.secondary">
                  {task.description || 'No description'}
                </Typography>
                <IconButton
                  onClick={() => deleteTask(task.id)}
                  color="secondary"
                >
                  <Delete />
                </IconButton>
              </CardContent>
            </Card>
          </Box>
        ))}
      </Container>
    </Box>
  );
}

export default TodoApp;
