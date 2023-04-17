/**
 * # Personal Website Kubernetes Manifests
 *
 * The manifests for resources inside the kubernetes cluster for my personal website.
 */

terraform {
  required_version = "1.4.5"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.19.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.43.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = local_sensitive_file.kubeconfig.filename
  }
}

provider "kubernetes" {
  config_path = local_sensitive_file.kubeconfig.filename

  # Enable manifest_resource to allow for directly applying a manifest file
  experiments {
    manifest_resource = true
  }
}

provider "null" {
}

provider "tfe" {
  token = var.tfe_token
}
