#Setup Timezone
resource "bigip_sys_ntp" "test" {
  description = "/Common/Test"
  servers = [
    var.ntp_server
  ]
  timezone = var.timezone
}
