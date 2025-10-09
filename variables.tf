variable "krystal_vpns" {
  type = list(string)
  default = [
    "91.194.74.23",
    "95.131.252.106",
    "100.64.16.0/22"
  ]
}

variable "zabbix_ips" {
  type = list(string)
  default = [
    "141.98.24.42",
    "185.44.252.118",
    "152.89.76.34",
    "185.69.56.25",
    "141.98.24.5",
    "77.72.7.10"
  ]
}

variable "rules_in" {
  default = []
}

variable "rules_out" {
  default = []
}

variable "name" {
  type = string
}

variable "vm_ids" {
  type = list(string)
}

variable "enable_krystal" {
  type    = bool
  default = true
}

variable "enable_zabbix" {
  type    = bool
  default = true
}

variable "enable_web" {
  type    = bool
  default = false
}
