/**
 * # Personal Website Kubernetes Manifests
 *
 * The manifests for resources inside the kubernetes cluster for my personal website.
 */

terraform {
  required_version = "1.5.2"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.22.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.46.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = local.host
    token                  = local.token
    cluster_ca_certificate = local.cluster_ca_certificate
  }
}

provider "kubernetes" {
  host                   = local.host
  token                  = local.token
  cluster_ca_certificate = local.cluster_ca_certificate

  # Enable manifest_resource to allow for directly applying a manifest file
  experiments {
    manifest_resource = true
  }
}

provider "tfe" {
  token = var.tfe_token
}
