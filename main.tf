
resource "grafana_organization" "geocomply" {
  provider = grafana.base
  name     = "geocomply"
}

provider "grafana" {
  alias  = "geocomply"
  url    = var.grafanaUrl
  auth   = "${var.grafanaAdminUser}:${var.grafanaAdminPassword}"
  org_id = grafana_organization.geocomply.org_id
}
resource "helm_release" "prometheus_operator" {
  name      = "kube-prometheus-stack"
  chart     = "${path.module}/grafana_chart"
  version   = ""
  namespace = var.monitoring_namespace

  skip_crds         = false
  create_namespace  = true
  dependency_update = true
  recreate_pods     = true
  force_update      = false
  atomic            = true
  cleanup_on_fail   = true
  wait              = true

  values = [
    templatefile("${path.module}/templates/kps.yaml", {
      monitoring_namespace = var.monitoring_namespace
    })
  ]
}



