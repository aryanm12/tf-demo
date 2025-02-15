# FETCH OIDC PROVIDER THUMBPRINT FOR ROOT CA AND CREATE OPENID CONNECT PROVIDER

data "aws_caller_identity" "current" {}

data "tls_certificate" "eks" {
  url = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.this.identity[0].oidc[0].issuer
}


resource "aws_eks_cluster" "this" {
  name    = var.cluster_name
  version = var.cluster_version

  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = false
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
  }
  
  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  tags       = var.tags
  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}

resource "aws_eks_fargate_profile" "main" {
  cluster_name           = aws_eks_cluster.this.name
  fargate_profile_name   = "fp-system"
  pod_execution_role_arn = aws_iam_role.eks_fargate_role.arn
  subnet_ids      = var.subnet_ids
  tags = merge(var.tags, {
    Name = "${var.cluster_name}-fp-system"
  })

  selector {
    namespace = "kube-system"
  }

  selector {
    namespace = "default"
  }

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSFargatePodExecutionRolePolicyfp]
}


resource "aws_eks_fargate_profile" "this" {
  for_each = var.fargate_profile

  cluster_name           = aws_eks_cluster.this.name
  fargate_profile_name   = each.key
  pod_execution_role_arn = aws_iam_role.eks_fargate_role.arn
  subnet_ids      = var.subnet_ids
  tags = merge(var.tags, {
    Name = "${var.cluster_name}-${each.key}"
  })

  selector {
    namespace = each.value.namespace
  }
  depends_on = [aws_iam_role_policy_attachment.AmazonEKSFargatePodExecutionRolePolicyfp]
}


resource "aws_eks_addon" "vpc-cni" {
  cluster_name             = aws_eks_cluster.this.name
  addon_name               = "vpc-cni"
  addon_version            = var.vpc_cni_version
  service_account_role_arn = aws_iam_role.vpc_cni.arn
  depends_on               = [aws_eks_fargate_profile.main]
}

resource "aws_eks_addon" "coredns" {
  cluster_name  = aws_eks_cluster.this.name
  addon_name    = "coredns"
  addon_version = var.coredns_version
  depends_on    = [aws_eks_fargate_profile.main]
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name  = aws_eks_cluster.this.name
  addon_name    = "kube-proxy"
  addon_version = var.kube_proxy_version
  depends_on    = [aws_eks_fargate_profile.main]
}