# Azure FastAPI React Todo Application – End-to-End DevOps Project

## 📌 Project Overview
This project demonstrates an end-to-end **monolithic application deployment on Microsoft Azure** using **DevOps and CI/CD best practices**.  
It consists of a **React frontend**, **FastAPI backend**, and **database**, all provisioned and managed through **Infrastructure as Code (Terraform)** and deployed using **Azure DevOps CI/CD pipelines**.

The application allows users to:
- Create Todo tasks with **title and description**
- Persist data in a database via backend APIs
- Fetch and display stored tasks dynamically on the frontend UI

---

## 🏗️ Architecture Overview

- **Frontend VM**
  - Hosts React-based UI
  - Communicates with backend via REST APIs

- **Backend VM**
  - Hosts FastAPI application
  - Handles API requests and database operations

- **Database**
  - Stores Todo task data (title, description)

- **Infrastructure**
  - Azure Resource Group
  - Azure Virtual Machines
  - Networking & connectivity
  - Provisioned using Terraform modules

- **CI/CD**
  - Azure DevOps Pipelines
  - Automated build & deployment for frontend and backend

---

## 📂 Project Structure

```text
Azure-FastAPI-React-TodoApp
│
├── Backend-Monolithic
│   ├── app.py
│   ├── Dockerfile
│   ├── requirements.txt
│   └── azure-pipelines.yml
│
├── Frontend-Monolithic
│   ├── public/
│   ├── src/
│   ├── package.json
│   ├── Dockerfile
│   └── azure-pipelines.yml
│
├── infra
│   ├── environments
│   │   └── dev
│   │       ├── main.tf
│   │       ├── provider.tf
│   │       ├── variables.tf
│   │       └── terraform.tfvars
│   │
│   └── modules
│       ├── azurerm_resource_group
│       ├── azurerm_virtual_machine
│       └── azurerm_database
│
└── README.md

```

## ⚙️ Infrastructure as Code (Terraform)
Modular Terraform architecture

Separate modules for:

Resource Group

Virtual Machines

Database

Environment-specific variables using terraform.tfvars

Enables scalable, reusable, and maintainable infrastructure

## 🔄 CI/CD Pipeline
Azure DevOps YAML-based pipelines

Automated stages include:

Code checkout

Build

Docker image creation

Deployment to Azure VMs

Separate pipelines for frontend and backend

Fully automated deployment with minimal manual intervention

## 🔐 Key DevOps Practices Implemented
Infrastructure as Code (IaC)

CI/CD automation

Environment segregation

Modular Terraform design

VM-based application hosting

Frontend–Backend–Database integration

Version control using Git & GitHub

## 🛠️ Tech Stack
Cloud: Microsoft Azure

Frontend: React.js

Backend: FastAPI (Python)

Database: Relational Database

IaC: Terraform

CI/CD: Azure DevOps Pipelines

Containerization: Docker

OS & Tools: Linux, VS Code, Git

## 🚀 Outcome
Successfully deployed a production-style application

Achieved automated infrastructure provisioning

Implemented reliable CI/CD pipelines

Demonstrated real-world DevOps workflow from code to production

## 📌 Author
Arpit Yadav
arpit39115@gmail.com
DevOps Engineer | Azure | Terraform | CI/CD | Docker | Kubernetes
