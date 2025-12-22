pipeline {
    agent any

    environment {
        APP_PORT = "5000"  // البورت اللي عايز تشغل عليه Flask
        DOCKER_IMAGE = "pythonapp-jenkins:latest"
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
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // لو فيه container شغال قبل كده، نحذفه
                    sh """
                    docker rm -f pythonapp || true
                    docker run -d --name pythonapp -p ${APP_PORT}:${APP_PORT} ${DOCKER_IMAGE}
                    """
                }
            }
        }

        stage('Smoke Test') {
            steps {
                script {
                    // تحقق إن التطبيق شغال على البورت
                    sh "curl -f http://localhost:${APP_PORT} || exit 1"
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully! Flask app running on port $APP_PORT"
            // مثال للإشعار على Slack (اختياري)
            // slackSend channel: '#devops', message: "Build Successful: $BUILD_URL"
        }
        failure {
            echo "Pipeline failed!"
            // slackSend channel: '#devops', message: "Build Failed: $BUILD_URL"
        }
    }
}

