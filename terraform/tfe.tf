data "tfe_outputs" "vendittelli" {
  organization = "vendittelli"
  workspace    = "vendittelli"
}

resource "null_resource" "always_run" {
  triggers = {
    timestamp = "${timestamp()}"
  }
}

resource "local_sensitive_file" "kubeconfig" {
  content_base64 = data.tfe_outputs.vendittelli.values.kubeconfig
  filename       = "kube_config.yaml"

  lifecycle {
    replace_triggered_by = [
      null_resource.always_run
    ]
  }
}
