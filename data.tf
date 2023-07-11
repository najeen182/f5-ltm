data "bigip_ltm_monitor" "https_monitor" {
  name      = "check_https"
  partition = var.partition
}
