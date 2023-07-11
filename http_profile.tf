resource "bigip_ltm_profile_http" "http" {
  name                  = "/Common/${var.domain_name}_http"
  defaults_from         = "/Common/http"
  insert_xforwarded_for = "enabled"
  head_erase            = ""
  accept_xff            = "enabled"
}
