provider "aws" {
  version = "~> 3.0"
  region  = "af-south-1"
}

# EKS Cluster IAM Role
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

# EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "k8s-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  }
}

# EKS Node Group
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "ng-node-group"
  node_role_arn   = aws_iam_role.eks_cluster_role.arn

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
}

# Outputs
output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

output "kubeconfig" {
  description = "Kubeconfig for EKS cluster access"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "node_group_name" {
  description = "EKS Node Group name"
  value       = aws_eks_node_group.node_group.node_group_name
}
