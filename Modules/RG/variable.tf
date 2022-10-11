variable "name" {
  type        = string 
  default = "Demo"
}

variable "location" {
  type        = string
  default = "East US"
}

variable "global_tags" {
  type        = map(any)
  default     = {}
}