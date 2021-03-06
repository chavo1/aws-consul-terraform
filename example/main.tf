module "consul_sofia" {
  source = "github.com/chavo1/aws-consul-terraform"

  consul_version = "${var.ami[var.consul_version]}"
  access_key     = "${var.access_key}"
  secret_key     = "${var.secret_key}"
  region         = "${var.region}"
  instance_type  = "${var.instance_type}"
  key_name       = "${var.key_name}"
  subnet         = "${var.subnet[0]}"
  server_count   = "${var.server_count}"
  dc_net         = "${var.dc_net["dc1"]}"
  dcname         = "${var.dcname["dc1"]}"
}

module "consul_varna" {
  source = "github.com/chavo1/aws-consul-terraform"

  consul_version = "${var.ami[var.consul_version]}"
  access_key     = "${var.access_key}"
  secret_key     = "${var.secret_key}"
  region         = "${var.region}"
  instance_type  = "${var.instance_type}"
  key_name       = "${var.key_name}"
  subnet         = "${var.subnet[1]}"
  server_count   = "${var.server_count}"
  dc_net         = "${var.dc_net["dc2"]}"
  dcname         = "${var.dcname["dc2"]}"
}

output "public_dns_servers_sofia" {
  value = "${module.consul_sofia.public_dns_servers}"
}

output "public_dns_servers_varna" {
  value = "${module.consul_varna.public_dns_servers}"
}
