variable "allocation" {
  type = list(string)
  default = ["Static", "Dynamic"]
}
variable "tier" {}
variable "protocol" {
    type =list(string)
}
variable "capacity" {}
variable "vnet-sub" {}
variable "appgwname" {}
variable "rule_type" {}
variable "skuname" {}
variable "port" {
  default = [80,443]
}

variable "request_timeout" {}