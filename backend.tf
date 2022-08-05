terraform {
  required_version = ">= 0.14"
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.22.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    pagerduty = {
      source = "pagerduty/pagerduty"
    }
  }
  backend "s3" {
    bucket         = "gc-sre-terraform-plans873212398515-us-east-1-dev"
    key            = "gc-sre/stacks/eks_grafana/dev/us-east-1/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform_locks"
  }
}