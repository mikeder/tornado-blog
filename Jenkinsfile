pipeline {
    agent {
        label 'testslave'
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
                    def branch = ${env.GIT_BRANCH}
                }
            }
        }

        stage('Build') {
            steps {
                sh "docker build . -t mikeder/tornado-blog:${branch}"
            }
        }

        stage('Test') {
            steps {
                sh "docker images"
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}