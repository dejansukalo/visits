pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dejansukalo-dockerhub')
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t dejansukalo/visits:1.0 .'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push dejansukalo/visits:1.0'
            }
        }
        stage ('Run container on Dev server') {
            steps {
                sshagent(credentials: ['dev-server']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@3.68.104.109 docker run -p 8080:8080 -d --name visits dejansukalo/visits:1.0"
                }
            }    
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}