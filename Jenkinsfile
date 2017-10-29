pipeline {
    agent {
        label 'docker-slave'
    }

    stages {

        stage('Checkout SCM'){
            steps {
                checkout scm
                script{
                    def commit = sh(
                        script: "git rev-parse HEAD",
                        returnStdout: true
                    ).trim()
                    echo env.BRANCH_NAME
                }
            }
        }

        stage('Build') {
            steps {
                script{
                    sh "docker build . -t mikeder/tornado-blog:${env.BRANCH_NAME}"
                }

            }
        }

        stage('Test') {
            steps {
                script {
                    sh "docker images"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}