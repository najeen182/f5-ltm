resource "bigip_ltm_virtual_server" "test-http" {
  name        = "/Common/test-http"
  destination = "192.168.1.4"
  description = "test http"
  port        = 80
  profiles    = ["/Common/http"]
  irules      = [data.bigip_ltm_irule.default.name]
}

resource "bigip_ltm_virtual_server" "test-https" {
  name        = "/Common/test-https"
  destination = "192.168.1.4"
  description = "test https"
  port        = 443
  profiles = [
    "/Common/http",
    "/Common/stream"
  ]
  client_profiles = [bigip_ltm_profile_client_ssl.test-ClientSsl.name]
  server_profiles = [bigip_ltm_profile_server_ssl.test-ServerSsl.name]
  irules          = [data.bigip_ltm_irule.default_https.name]

  source_address_translation = "automap"
  translate_address          = "enabled"
  translate_port             = "enabled"
  vlans_enabled              = true
  vlans                      = ["/Common/external"]
}
