pipeline {
    agent {
        label 'testslave'
    }

    stages {

        stage('Checkout SCM'){
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'docker build . -t mikeder/tornado-blog:${env.GIT_BRANCH}'
            }
        }

        stage('Test') {
            steps {
                sh 'docker images'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}