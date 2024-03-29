resource "helm_release" "argocd" {
  name = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.46.7"

  namespace        = "argocd"
  create_namespace = true
}

resource "kubernetes_manifest" "root" {
  manifest = yamldecode(file("manifest.yaml"))

  depends_on = [
    helm_release.argocd
  ]
}
