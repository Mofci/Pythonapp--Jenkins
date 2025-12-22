pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run Python App') {
            steps {
                sh '''
                python3 --version
                python3 hello.py
                '''
            }
        }
    }
}

