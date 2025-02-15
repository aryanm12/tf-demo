resource "aws_ec2_tag" "subnet_for_aws_lbc" {
  for_each    = toset(var.subnet_ids)
  resource_id = each.value
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
} 


resource "helm_release" "aws_lb_controller" {
  count      = var.create_aws_lb_controller ? 1 : 0
  name       = "aws-load-balancer-controller"
  repository = "oci://${var.ecr_aws_account_id}.dkr.ecr.${var.region}.amazonaws.com"
  chart      = "aws-load-balancer-controller"
  version    = var.helm_chart_version
  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = aws_eks_cluster.this.name
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.aws_load_balancer_controller.arn
  }

  set {
    name  = "region"
    value = var.region
  }

  set {
    name  = "vpcId"
    value = var.vpc_id
  }

  set {
    name = "enableWaf"
    value = "false"
  }

  set {
    name = "enableWafv2"
    value = "false"
  }

  set {
    name = "enableShield"
    value = "false"
  }

  depends_on = [aws_eks_fargate_profile.main]
}