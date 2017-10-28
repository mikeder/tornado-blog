pipeline {
    agent {
        label 'testslave'
    }

    stages {

        stage('Checkout SCM'){
            steps {
                checkout scm
                sh 'git rev-parse HEAD > commit'
                def commit = readFile('commit').trim()
                def branch = ${env.GIT_BRANCH}
            }
        }

        stage('Build') {
            steps {
                sh 'docker build . -t mikeder/tornado-blog:$branch'
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