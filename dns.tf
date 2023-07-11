resource "bigip_sys_dns" "dns" {
  description    = "/Common/My-DNS"
  name_servers   = var.resolver
  number_of_dots = 2
  search         = [var.domain_name]
}
