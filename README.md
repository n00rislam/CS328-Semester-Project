# E-Commerce Microservices Deployment with AWS EKS

This project demonstrates a production-grade microservices deployment using modern DevOps practices and tools.

## Architecture Overview

The project consists of three microservices:
- User Service: Handles user management
- Product Service: Manages product catalog
- Order Service: Processes orders

### Technology Stack

- **Infrastructure as Code**: Terraform
- **Container Orchestration**: Kubernetes (AWS EKS)
- **Containerization**: Docker
- **CI/CD**: Jenkins
- **Monitoring**: Prometheus & Grafana
- **Cloud Provider**: AWS
- **Programming Language**: Python (Flask)

## Prerequisites

Before you begin, ensure you have the following installed:

- AWS CLI configured with appropriate credentials
- Terraform (>= 1.0.0)
- kubectl
- Docker
- Helm (for Prometheus/Grafana installation)
- Jenkins (for CI/CD pipeline)

## Project Structure

```
ecommerce-deployment/
├── terraform/          # Infrastructure as Code
├── services/           # Microservices
├── kubernetes/         # K8s manifests
├── Jenkinsfile        # CI/CD pipeline
└── README.md
```

## Getting Started

1. **Deploy Infrastructure**
   ```bash
   cd terraform
   terraform init
   terraform plan
   terraform apply
   ```

2. **Configure kubectl**
   ```bash
   aws eks update-kubeconfig --name ecommerce-cluster --region us-east-1
   ```

3. **Deploy Microservices**
   ```bash
   kubectl apply -f kubernetes/
   ```

4. **Install Monitoring Stack**
   ```bash
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   helm install prometheus prometheus-community/kube-prometheus-stack
   ```

5. **Access Grafana**
   ```bash
   kubectl port-forward svc/prometheus-grafana 3000:80
   # Access Grafana at http://localhost:3000
   # Default credentials:
   # Username: admin
   # Password: prom-operator
   ```

## Monitoring

The monitoring stack includes:
- Prometheus for metrics collection
- Grafana for visualization
- Basic dashboards for:
  - Node metrics
  - Pod metrics
  - Service metrics

## CI/CD Pipeline

The Jenkins pipeline:
1. Builds Docker images for each service
2. Pushes images to container registry
3. Deploys to Kubernetes cluster

## AWS Services Used

- **EKS**: Managed Kubernetes cluster
- **VPC**: Network isolation
- **IAM**: Access management
- **Security Groups**: Network security

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License

## Support

For support, please open an issue in the repository. 
