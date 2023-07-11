terraform {
  backend "http" {

  }
  required_providers {
    bigip = {
      source = "terraform-providers/bigip"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address     = var.hostname
  username    = var.username
  password    = var.password
  token_value = var.token_value
  token_auth  = true
}
