pipeline {
    agent any
    
    environment {
        DOCKER_USERNAME = 'noor231'
        KUBECONFIG = credentials('eks-kubeconfig')
    }
    
    stages {
        stage('Build Services') {
            parallel {
                stage('Build User Service') {
                    steps {
                        dir('services/user-service') {
                            sh "docker build -t $noor231/user-service:latest ."
                        }
                    }
                }
                stage('Build Product Service') {
                    steps {
                        dir('services/product-service') {
                            sh "docker build -t $noor231/product-service:latest ."
                        }
                    }
                }
                stage('Build Order Service') {
                    steps {
                        dir('services/order-service') {
                            sh "docker build -t $noor231/order-service:latest ."
                        }
                    }
                }
            }
        }
        
        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        
        stage('Push Images') {
            parallel {
                stage('Push User Service') {
                    steps {
                        sh "docker push noor231/user-service:latest"
                    }
                }
                stage('Push Product Service') {
                    steps {
                        sh "docker push noor231/product-service:latest"
                    }
                }
                stage('Push Order Service') {
                    steps {
                        sh "docker push noor231/order-service:latest"
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    kubectl apply -f kubernetes/user-deployment.yml
                    kubectl apply -f kubernetes/service-user.yml
                    kubectl apply -f kubernetes/product-deployment.yml
                    kubectl apply -f kubernetes/service-product.yml
                    kubectl apply -f kubernetes/order-deployment.yml
                    kubectl apply -f kubernetes/service-order.yml
                '''
            }
        }
    }
    
    post {
        always {
            sh 'docker logout'
        }
    }
} 
