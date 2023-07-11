resource "bigip_ltm_policy" "test-policy" {
  name     = "/Common/test-policy"
  strategy = "first-match"
  requires = ["http"]
  controls = ["forwarding"]

  rule {
    name = "test-rule"
    action {
      forward = true
      pool    = bigip_ltm_pool.test_pool.name
    }
  }
  depends_on = [bigip_ltm_pool.test_pool]
}
