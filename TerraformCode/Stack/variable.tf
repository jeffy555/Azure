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


variable "tier_app_service" {}
variable "size_service_plan" { }
variable "service_plan" {}
variable "app_service_name" { }
variable "storage_replication" {}
variable "storagename_DB" {}
variable "storage_tier" {}
variable "sqldb" {}
variable "genpassword" { }
variable "sqlservername" {}
variable "sqlusername" {}
