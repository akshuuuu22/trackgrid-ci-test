pipeline {
    agent any

    stages {

        stage('Pre-check Docker') {
            steps {
                script {
                    if (!fileExists('/usr/bin/docker')) {
                        error("Docker not installed! Pipeline stopping...")
                    }
                }
                sh 'docker --version'
            }
        }

        stage('Checkout Code') {
            steps {
                git 'https://github.com/akshuuuu22/trackgrid-ci-test.git'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t trackgrid-svc:4 .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker rm -f trackgrid || true
                docker run -d --name trackgrid -p 12024:12024 trackgrid-svc:4
                '''
            }
        }
    }

    post {
        success {
            echo "Build and container deployment successful!"
        }
    }
}
