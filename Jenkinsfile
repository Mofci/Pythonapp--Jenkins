pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "python-flask-app:latest"
        APP_PORT = "5000"
    }

    stages {

        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/Mofci/Pythonapp--Jenkins'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                python3 -m venv venv
                source venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh '''
                source venv/bin/activate
                pytest tests/ --maxfail=1 --disable-warnings
                '''
            }
        }

        stage('Run Python App (Smoke Test)') {
            steps {
                sh '''
                source venv/bin/activate
                nohup python3 app.py &
                sleep 5
                curl -f http://localhost:5000 || exit 1
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f flask_app || true
                docker run -d -p $APP_PORT:5000 --name flask_app $DOCKER_IMAGE
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully! Flask app running on port $APP_PORT"
            
            // slackSend channel: '#devops', message: "Build Successful: $BUILD_URL"
        }
        failure {
            echo "Pipeline failed!"
            // slackSend channel: '#devops', message: "Build Failed: $BUILD_URL"
        }
    }
}

