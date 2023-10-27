pipeline {
    agent any

    environment {
        // Define environment variables, if needed
        DOCKER_IMAGE = 'gra88er/my-flask-app'
        DOCKER_CREDENTIAL_ID = 'Docker_Credential_ID'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Get the code from the version control system.
                checkout ([$class: 'GitSCM', branches: [${BRANCH_NAME}], extensions: [], userRemoteConfigs: [[credentialsId: 'Docker_Credential_ID', url: 'https://github.com/E-V-C/webapp.git']]])
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE}:${BRANCH_NAME} ."
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    // Login to DockerHub
                    sh "docker login -u gra88er -p fakKer-2buqvu-juqjeq"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to DockerHub
                    sh "docker push ${DOCKER_IMAGE}:${BRANCH_NAME}"
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    // SSH into EC2 and run the Docker container
                    sh '''!/bin/bash
                    ssh -i "team7key2.pem" ubuntu@172.31.29.243 "docker pull ${my-flask-app}:${BRANCH_NAME}; docker run -d -p 80:5000 ${my-flask-app}:${BRANCH_NAME}"
                    '''
                }
            }
        }
    }
}
