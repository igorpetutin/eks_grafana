provider "grafana" {
  alias = "base"
  url   = var.grafana_url
  auth  = "${var.grafana_admin_user}:${var.grafana_admin_password}"
}
provider "aws" {
  /* access_key = var.access_key
  secret_key = var.secret_key */
  region = "us-east-1"

  /* profile    = "dev"  */

  assume_role {
    role_arn = "arn:aws:iam::873212398515:role/sandbox-us-east-1"
  }
}

data "aws_caller_identity" "current" {} # used for accesing Account ID and ARN

data "aws_eks_cluster_auth" "cluster" {
  name = "gc-infra-sb-eks-monitoring"
}

data "terraform_remote_state" "base" {
  backend = "s3"

  config = {
    bucket = "gc-sre-terraform-plans"
    key    = "gc-sre-cluster/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.base.outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.base.outputs.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}
provider "pagerduty" {
  token = var.pagerduty_token
}
