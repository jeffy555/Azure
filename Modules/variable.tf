variable "name_vnet" {
  type    = string
}

variable "address_space" {
}

variable "frontend_prefix" {
}
variable "backend_prefix" {
}
variable "backend_prefix2" {
}
variable "frontend" {
}
variable "backend1" {
}
variable "backend2" {
}

variable "pubip" {
}

variable "port" {
}
variable "allocation" {
    type = string
}

variable "appgw" {
}

variable "skuname" {}
variable "tier" {
    description = "Standard / StandardV2 / WAF/ WAF_V2"
}
variable "capacity" {
    description = "Between 1 and 32 / 1 to 125 for V2"
}
variable "request_timeout" {
}

variable "vnet-sub"{
    type = string
}
variable "rule_type" {
    description = "Whether it is path basic or pathbasedrouting defaults to basic"
}

variable "protocol" {
    description = "Http or Https"
}

variable "name" {
  type        = string 
}

variable "location" {
  type        = string
}

variable "tier_app_service" {}
variable "size_service_plan" { }
variable "service_plan" {}
variable "app_service_name" { }