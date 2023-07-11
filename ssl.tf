resource "bigip_ssl_certificate" "cert" {
  name      = "${var.domain_name}.crt"
  content   = file("certs/${var.domain_name}.crt")
  partition = var.partition
}

resource "bigip_ssl_key" "key" {
  name      = "${var.domain_name}.key"
  content   = file("certs/${var.domain_name}.key")
  partition = var.partition
}
