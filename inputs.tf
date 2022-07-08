
variable "grafana_url" {
  description = "Main domain"
  type        = string
  default     = "https://grafana-sb.geocomply.net"
}

variable "grafana_admin_password" {
  description = "Default admin password for Grafana admin user"
  type        = string
  default     = "ThisIsDefaultPassword"
}

variable "grafana_admin_user" {
  description = "Default admin user for Grafana"
  type        = string
  default     = "admin"
}
variable "monitoring_namespace" {
  description = "Kubernetes namespace to deploy"
  default     = "monitoring"
  type        = string
}