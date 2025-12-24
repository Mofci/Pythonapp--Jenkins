pipeline {
    agent any

    environment {
        APP_PORT = "5000"
        IMAGE_NAME = "pythonapp-jenkins:latest"
        CONTAINER_NAME = "pythonapp"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/Mofci/Pythonapp--Jenkins'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
   
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                  
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:${APP_PORT} ${IMAGE_NAME}"
                }
            }
        }

        stage('Smoke Test') {
            steps {
                script {
               
                    sh "curl -f http://localhost:${APP_PORT}"
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully! Flask app running on port ${APP_PORT}"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}

