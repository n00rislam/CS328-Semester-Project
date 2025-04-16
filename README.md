# 🛒 E-Commerce Microservices Deployment with AWS EKS & CI/CD

## 🚀 Overview

This project demonstrates a scalable, cloud-native deployment of an **E-commerce microservices application** using **AWS Elastic Kubernetes Service (EKS)**. The system is fully containerized with **Docker**, orchestrated using **Kubernetes**, and deployed through an automated **CI/CD pipeline** built with **Jenkins** or **GitLab CI**. The backend is powered by **Amazon RDS**, and robust monitoring is achieved using **Prometheus** and **Grafana**. Infrastructure provisioning is handled using **Terraform**.

---

## 🧱 Project Architecture

Below is the high-level architecture of the deployed system:

![Architecture Diagram](./A_schematic_diagram_illustrates_an_E-commerce_micr.png)

### 🧩 Components

- **Cloud Infrastructure (AWS)**:  
  EKS, EC2, RDS, VPC, S3, IAM, Route 53

- **Microservices**:
  - 🧑‍💼 User Service
  - 📦 Product Service
  - 📋 Order Service

- **Containerization**: Docker  
- **Orchestration**: Kubernetes (EKS)  
- **CI/CD Pipeline**: Jenkins or GitLab CI with Docker, Kubernetes, and Helm  
- **Database**: Amazon RDS (MySQL or PostgreSQL)  
- **Monitoring**: Prometheus & Grafana  
- **Infrastructure as Code**: Terraform  

---

## 🔧 Prerequisites

Make sure the following tools and accounts are set up before starting:

- ✅ An active AWS Account
- 🐳 Docker installed and running
- ⚙️ `kubectl` installed and configured for your EKS cluster
- ☁️ AWS CLI installed and authenticated
- 🔄 Jenkins or GitLab CI for CI/CD
- 🛠️ Terraform for infrastructure provisioning
- 👨‍💻 Familiarity with **Python (Flask/Django)** or **Java (Spring Boot)** for developing microservices

---

## 📌 Key Features

- End-to-end CI/CD pipeline with automated deployment to AWS EKS
- Modular microservices architecture with containerized services
- Secure and scalable infrastructure managed via Terraform
- Real-time monitoring and visualization with Prometheus and Grafana
- Cloud-native best practices applied throughout the stack

---

## 📈 Future Enhancements

- Add auto-scaling policies via Kubernetes HPA
- Implement service mesh with Istio
- Add log aggregation with ELK or Loki
- Enable multi-region failover

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).


