resource "bigip_ltm_monitor" "https_monitor" {
  name        = "/Common/check_https"
  parent      = var.monitor.parent
  timeout     = var.monitor.timeout
  interval    = var.monitor.interval
  destination = "*:443"
}

resource "bigip_ltm_monitor" "http_monitor" {
  name        = "/Common/check_http"
  parent      = var.monitor.parent
  timeout     = var.monitor.timeout
  interval    = var.monitor.interval
  destination = "*:80"
}
