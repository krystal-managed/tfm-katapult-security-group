variable "krystal_vpns" {
  type = list(any)
  default = [
    {
      name    = "VPN 1"
      address = "91.194.74.23"
    },
    {
      name    = "VPN 2"
      address = "95.131.252.106"
    },
    {
      name    = "Tailscale"
      address = "100.64.16.0/22"
    }
  ]
}

variable "zabbix_ips" {
  type = list(any)
  default = [
    {
      name    = "zbx-proxy-ams-01"
      address = "141.98.24.42"
    },
    {
      name    = "zbx-proxy-lon-01"
      address = "185.44.252.118"
    },
    {
      name    = "zbx-proxy-ny-01"
      address = "152.89.76.34"
    },
    {
      name    = "zbx-proxy-pho-01"
      address = "185.69.56.25"
    },
    {
      name    = "zbx-srv-ams-01"
      address = "141.98.24.5"
    },
    {
      name    = "zbx-srv-lon-01"
      address = "77.72.7.10"
    }
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
