pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t vle7-java-app:latest .'
            }
        }

        stage('Load Image into Minikube') {
            steps {
                sh 'sudo -u ubuntu minikube image load vle7-java-app:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'sudo -u ubuntu minikube kubectl -- apply -f k8s/deployment.yaml'
                sh 'sudo -u ubuntu minikube kubectl -- apply -f k8s/service.yaml'
                sh 'sudo -u ubuntu minikube kubectl -- rollout restart deployment/java-app'
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'sudo -u ubuntu minikube kubectl -- rollout status deployment/java-app'
                sh 'sudo -u ubuntu minikube kubectl -- get pods'
                sh 'sudo -u ubuntu minikube kubectl -- get services'
            }
        }
    }
}
