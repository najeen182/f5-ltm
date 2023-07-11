resource "bigip_ltm_profile_client_ssl" "client_ssl" {
  name          = "/Common/${var.domain_name}_clientssl"
  defaults_from = "/Common/clientssl"
  authenticate  = "always"
  ciphers       = "DEFAULT"
  cert          = "/Common/${var.domain_name}.crt"
  key           = "/Common/${var.domain_name}.key"
  depends_on = [
    bigip_ssl_certificate.cert,
    bigip_ssl_key.key,

  ]
}

resource "bigip_ltm_profile_server_ssl" "server_ssl" {
  name          = "/Common/${var.domain_name}_serverssl"
  defaults_from = "/Common/serverssl"
  authenticate  = "always"
  ciphers       = "DEFAULT"
  cert          = "/Common/${var.domain_name}.crt"
  key           = "/Common/${var.domain_name}.key"
  depends_on = [
    bigip_ssl_certificate.cert,
    bigip_ssl_key.key,

  ]
}
