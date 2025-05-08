pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKER_USERNAME = 'noor231'
        KUBECONFIG = credentials('eks-kubeconfig')
        VERSION = "${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Services') {
            parallel {
                stage('Build User Service') {
                    steps {
                        dir('services/user-service') {
                            script {
                                if (fileExists('Dockerfile')) {
                                    sh "docker build --cache-from $noor231/user-service:latest -t $noor231/user-service:${VERSION} -t $noor231/user-service:latest ."
                                } else {
                                    error "Dockerfile not found in user-service directory"
                                }
                            }
                        }
                    }
                }
                stage('Build Product Service') {
                    steps {
                        dir('services/product-service') {
                            script {
                                if (fileExists('Dockerfile')) {
                                    sh "docker build --cache-from $noor231/product-service:latest -t $noor231/product-service:${VERSION} -t $noor231/product-service:latest ."
                                } else {
                                    error "Dockerfile not found in product-service directory"
                                }
                            }
                        }
                    }
                }
                stage('Build Order Service') {
                    steps {
                        dir('services/order-service') {
                            script {
                                if (fileExists('Dockerfile')) {
                                    sh "docker build --cache-from $noor231/order-service:latest -t $noor231/order-service:${VERSION} -t $noor231/order-service:latest ."
                                } else {
                                    error "Dockerfile not found in order-service directory"
                                }
                            }
                        }
                    }
                }
            }
        }
        
        stage('Login to DockerHub') {
            steps {
                script {
                    try {
                        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    } catch (Exception e) {
                        error "Failed to login to DockerHub: ${e.message}"
                    }
                }
            }
        }
        
        stage('Push Images') {
            parallel {
                stage('Push User Service') {
                    steps {
                        script {
                            try {
                                sh "docker push $noor231/user-service:${VERSION}"
                                sh "docker push $noor231/user-service:latest"
                            } catch (Exception e) {
                                error "Failed to push user-service: ${e.message}"
                            }
                        }
                    }
                }
                stage('Push Product Service') {
                    steps {
                        script {
                            try {
                                sh "docker push $noor231/product-service:${VERSION}"
                                sh "docker push $noor231/product-service:latest"
                            } catch (Exception e) {
                                error "Failed to push product-service: ${e.message}"
                            }
                        }
                    }
                }
                stage('Push Order Service') {
                    steps {
                        script {
                            try {
                                sh "docker push $noor231/order-service:${VERSION}"
                                sh "docker push $noor231/order-service:latest"
                            } catch (Exception e) {
                                error "Failed to push order-service: ${e.message}"
                            }
                        }
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    try {
                        sh '''
                            kubectl apply -f kubernetes/user-deployment.yml
                            kubectl apply -f kubernetes/service-user.yml
                            kubectl apply -f kubernetes/product-deployment.yml
                            kubectl apply -f kubernetes/service-product.yml
                            kubectl apply -f kubernetes/order-deployment.yml
                            kubectl apply -f kubernetes/service-order.yml
                        '''
                    } catch (Exception e) {
                        error "Failed to deploy to Kubernetes: ${e.message}"
                    }
                }
            }
        }
    }
    
    post {
        always {
            sh 'docker logout'
            cleanWs()
        }
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
} 
