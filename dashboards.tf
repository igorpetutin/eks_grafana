/* resource "grafana_dashboard" "generalCadvisor" {
  provider    = grafana.base
  config_json = file("./dashboards/general-cadvisor.json")
} */
/* data "dashboards_filename_list" "jsons" {
  pattern = "./dashboards/*.json"
} */
resource "grafana_dashboard" "additional" {
  /* provider    = grafana.base */
  for_each    = fileset(path.module, "./dashboards/*.json")
  config_json = file(each.key)
}
