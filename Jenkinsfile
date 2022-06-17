pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dejansukalo-dockerhub')
    }
    stages {
        stage ('Tooling versions') {
            steps {
                sh '''
                    docker --version
                    docker-compose up
                sh '''    
            }
        }
        stage ('Build') {
            steps {
                sh 'docker compose up'
            }
        } 
    }
}