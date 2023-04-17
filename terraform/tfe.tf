data "tfe_outputs" "vendittelli" {
  organization = "vendittelli"
  workspace    = "vendittelli"
}

locals {
  kubeconfig             = yamldecode(base64decode(data.tfe_outputs.vendittelli.values.kubeconfig))
  host                   = local.kubeconfig.clusters[0].cluster.server
  token                  = local.kubeconfig.users[0].user.token
  cluster_ca_certificate = base64decode(local.kubeconfig.clusters[0].cluster.certificate-authority-data)
}
