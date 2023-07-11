resource "bigip_ltm_pool" "test_pool" {
  name       = "/Common/test-pool"
  allow_nat  = "yes"
  allow_snat = "yes"
  monitors   = ["${data.bigip_ltm_monitor.monitor_https.name}"]

  load_balancing_mode = "round-robin"
}


resource "bigip_ltm_node" "node" {
  name             = "/Common/test_node"
  address          = "192.168.1.4"
  description      = "Test-Node"
  monitor          = "/Common/icmp"
  rate_limit       = "disabled"
  dynamic_ratio    = "1"
  connection_limit = "0"

}

resource "bigip_ltm_pool_attachment" "attach_node" {
  pool = bigip_ltm_pool.test_pool.name
  node = "${bigip_ltm_node.node.name}:443"
}
