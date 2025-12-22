pipeline {
    agent any

    environment {
        APP_ENV = "dev"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run Python App') {
            steps {
                sh 'python3 app.py'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'python3 -m pytest test_hello.py'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t python-hello:1.0 .'
            }
        }

        stage('Notify') {
            steps {
                echo 'Build and Docker image creation successful! '
            }
        }
    }

    post {
        failure {
            echo 'Build failed! '
        }
        success {
            echo 'Build succeeded! '
        }
    }
}

