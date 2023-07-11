variable "partition" {
  type        = string
  description = "F5 Partition Name"
  default     = "Common"
}


variable "timezone" {
  type        = string
  description = "Timezone"
  default     = "Asia/Kathmandu"
}

variable "ntp_server" {
  type        = string
  description = "Timezone Server"
  default     = "0.asia.pool.ntp.org"

}


variable "resolver" {
  type = list(string)
  default = [
    "8.8.8.8",
    "8.8.4.4"
  ]
}

variable "monitor" {
  type = object({
    parent   = string
    timeout  = string
    interval = string
  })
  default = {
    parent   = "/Common/tcp"
    timeout  = "15"
    interval = "5"
  }
}

