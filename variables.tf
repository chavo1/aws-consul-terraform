variable "access_key" {}
variable "secret_key" {}

variable "server_count" {
  default = 3
}

variable "subnet" {}

variable "dcname" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {}

variable "dc_net" {}

variable "consul_version" {}

variable "region" {
  default = "us-east-1"
}

variable "create" {
  description = "Create Module, defaults to true."
  default     = true
}

variable "name" {
  description = "Name for resources, defaults to \"consul-auto-join-instance-role-aws\"."
  default     = "consul-auto-join-aws"
}
