/* resource "grafana_dashboard" "generalCadvisor" {
  provider    = grafana.base
  config_json = file("./dashboards/general-cadvisor.json")
} */

data "dashboards_filename_list" "jsons" {
  pattern = "./dashboards/*.json"
}


resource "grafana_dashboards" "additional" {
  provider    = grafana.base
  count       = length(data.dashboards_filename_list.jsons.matches)
  config_json = file(element(data.dashboards_filename_list.jsons.matches, count.index))
}
