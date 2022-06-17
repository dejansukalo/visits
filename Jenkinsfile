pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dejansukalo-dockerhub')
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t dejansukalo/visits:1.0 .'
            }
        }
        stage ('Login') {
            steps {
                sh 'echo DOCKERHUB_CREDENTIALS_PSW | docker login -u DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage ('Push') {
            steps {
                sh 'docker push dejansukalo/visits:1.0' 
            }
        }
    }
}