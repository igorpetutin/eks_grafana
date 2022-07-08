resource "grafana_data_source" "prometheus_alertManager" {
  type     = "camptocamp-prometheus-alertmanager-datasource"
  provider = grafana.base
  name     = "Prometheus AlertManager"
  url      = "http://kube-prometheus-stack-alertmanager:9093/"
}
