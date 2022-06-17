pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dejansukalo-dockerhub')
    }
    stages {
        stage ('Build') {
            steps {
                sshagent(credentials: ['dev-server']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@3.68.104.109 docker-compose up"
                }
            } 
        }
    }
}