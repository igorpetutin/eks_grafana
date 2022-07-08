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
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    pagerduty = {
      source = "pagerduty/pagerduty"
    }
  }
  backend "s3" {
    bucket = "gc-sre-terraform-plans"
    key    = "gc-sre-cluster-resources/grafana.tfstate"
    region = "us-east-1"
  }
}

