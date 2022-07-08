resource "grafana_folder" "alertsFolder" {
  provider = grafana.base
  title    = "Alert Services"
}

resource "grafana_folder_permission" "alertPermission" {
  provider   = grafana.base
  folder_uid = grafana_folder.alertsFolder.uid
  permissions {
    role       = "Editor"
    permission = "View"
  }
}