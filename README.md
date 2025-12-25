# 🚀 Python Flask CI/CD with Jenkins & Docker

## 📌 Project Overview
A simple Python Flask application deployed using a complete CI/CD pipeline with Jenkins and Docker.

## 🛠 Tech Stack
- Python
- Flask
- Docker
- Jenkins
- Git & GitHub

## 🔄 CI/CD Pipeline Stages
1. Checkout code from GitHub
2. Build Docker image
3. Run Docker container
4. Smoke test using curl

## ▶ Run Locally
```bash
docker build -t flask-app .
docker run -p 5000:5000 flask-app
