pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "pythonapp-jenkins:latest"
        APP_PORT = "5000"
    }
    stages {
        stage('Checkout SCM') {
            steps {
                git url: 'https://github.com/Mofci/Pythonapp--Jenkins', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker rm -f pythonapp || true"
                    sh "docker run -d --name pythonapp -p $APP_PORT:$APP_PORT $DOCKER_IMAGE"
                }
            }
        }
        stage('Smoke Test') {
            steps {
                script {
                    sh "curl -f http://localhost:$APP_PORT"
                }
            }
        }
    }
    post {
        success {
            echo "Pipeline executed successfully! Flask app running on port $APP_PORT"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}

