# Kubernetes Cluster Deployment on AWS using Terraform

## Overview

This repository demonstrates how to deploy a fully functional Kubernetes cluster on AWS using Terraform for infrastructure provisioning and YAML for Kubernetes configuration. The cluster is provisioned using Amazon EKS, with an NGINX web server deployed as a simple example.

## Features

- Automated deployment of Kubernetes clusters on AWS using Terraform
- NGINX web server deployed with a scalable deployment configuration
- Kubernetes service exposed via a LoadBalancer
- Easily configurable infrastructure and deployment settings

## Prerequisites

To successfully deploy this project, ensure you have the following installed:

- **Terraform 1.1+**
- **AWS CLI**
- **kubectl 1.22+**

## Infrastructure Overview

This project uses Terraform to provision an Amazon Elastic Kubernetes Service (EKS) cluster with autoscaling node groups. Kubernetes manifests (`deployment.yaml` and `service.yaml`) handle the deployment of an NGINX web server and expose it using a LoadBalancer service.

## Deployment Steps

1. **Clone the repository**:
   
   ```bash
   https://github.com/ThabangKhasebe/kubernetes-aws-terraform-deployment.git

2. **Navigate into the repository**:

   ```bash
   cd kubernetes-aws-terraform-deployment

3. **Initialize Terraform**:

   ```bash
   terraform init

4. **Deploy the infrastructure**:

   ```bash
   terraform apply

5. **Deploy Kubernetes resources**:

   ```bash
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml

6. **Verify NGINX deployment**:

   ```bash
   kubectl get services

Access the NGINX web server via the external IP provided by the LoadBalancer service.


