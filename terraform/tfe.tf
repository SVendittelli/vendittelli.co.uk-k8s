data "tfe_outputs" "vendittelli" {
  organization = "vendittelli"
  workspace    = "vendittelli"
}

resource "local_sensitive_file" "kubeconfig" {
  content_base64 = data.tfe_outputs.vendittelli.values.kubeconfig
  filename       = "kube_config.yaml"
}
