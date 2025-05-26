pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "shakuntala22/train-schedule:${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/cicd-pipeline-train-schedule-autodeploy.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-creds', url: '']) {
                    script {
                        docker.image("${DOCKER_IMAGE}").push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl set image deployment/train-schedule train-schedule=${DOCKER_IMAGE}'
            }
        }
    }
}
