<!-- BEGIN_TF_DOCS -->
# Personal Website Kubernetes Manifests

The manifests for resources inside the kubernetes cluster for my personal website.

## Requirements

| Name | Version |
|------|---------|
| terraform | 1.4.5 |
| helm | 2.9.0 |
| kubernetes | 2.19.0 |
| tfe | 0.43.0 |

## Providers

| Name | Version |
|------|---------|
| helm | 2.9.0 |
| kubernetes | 2.19.0 |
| tfe | 0.43.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/2.9.0/docs/resources/release) | resource |
| [kubernetes_manifest.root](https://registry.terraform.io/providers/hashicorp/kubernetes/2.19.0/docs/resources/manifest) | resource |
| [tfe_outputs.vendittelli](https://registry.terraform.io/providers/hashicorp/tfe/0.43.0/docs/data-sources/outputs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tfe\_token | The access token for Terraform Cloud | `string` | n/a | yes |
<!-- END_TF_DOCS -->
