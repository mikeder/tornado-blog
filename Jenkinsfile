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
                    def branch = env.BRANCH_NAME
                }
                echo 'Working on branch: '${branch}
            }
        }

        stage('Build') {
            steps {
                script{
                    sh "docker build . -t mikeder/tornado-blog:\${branch}"
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