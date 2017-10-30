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

        stage('Build & Push Image') {
            steps {
                dir (".") {
                    script {
                        def image = docker.build("mikeder/tornado-blog")
                        docker.withRegistry('https://index.docker.io/v1/', 'mikeder-dockerhub') {
                            image.push("latest")
                            image.push("${env.BRANCH_NAME}-${env.BUILD_ID}")
                        }
                        sh "docker rmi ${image.id}"
                    }
                }
            }
        }

        stage('List Images') {
            steps {
                script {
                    sh "docker images"
                    sh "df -h"
                }
            }
        }
    }
}