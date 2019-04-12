# This example contains code which deploys a [Consul](https://www.consul.io/) cluster in AWS from this [module](https://github.com/chavo1/aws-consul-terraform).

## Joining of the consul agent is done with:
- Cloud Auto-joining more info [HERE](https://www.consul.io/docs/agent/cloud-auto-join.html) and examples [HERE](https://github.com/hashicorp-modules/consul-auto-join-instance-role-aws)
  - | [iam_instance_profile](https://www.terraform.io/docs/providers/aws/r/instance.html#iam_instance_profile)

## Prerequisites
- Please install the following component:
  - | [Terraform](https://www.terraform.io/)
- You must also have an AWS account. 
- Clone the repo:
```
git clone git clone https://github.com/chavo1/aws-consul-terraform.git
cd consul aws-consul-terraform/example
```
- Create terraform.tfvars file with needed credential and variables and set consul version based on your AMI:
```
access_key = "< Your AWS Access_key >"
secret_key = "< Your AWS Secret_key >"
key_name = ""

consul_version  = "1.4.4"

subnet = [
    "< VPC subnet ID >",
    "< VPC subnet ID >"
]
```
### We can start with deploying process
```
terraform init
terraform plan
terraform apply
```
### Do not forget to destroy the environment after the test
```
terraform destroy
```

### To test the module you will need Kitchen:

Kitchen is a RubyGem so please find how to install and setup Test Kitchen, check out the [Getting Started Guide](http://kitchen.ci/docs/getting-started/).
For more information about kitchen tests please check the next link:

https://kitchen.ci/docs/getting-started/running-test/

Than simply execute a following commands:
```
kitchen converge
kitchen verify
kitchen destroy
```
- Kitchen-Terraform tests are for 2 Consul servers and 2 Consul clients and should be as follow:
```
Command: `terraform state list`
     ✔  stdout should include "module.consul_varna.aws_instance.server[0]"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
  Command: `terraform state list`
     ✔  stdout should include "module.consul_sofia.aws_instance.server[0]"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
  Command: `terraform state list`
     ✔  stdout should include "module.consul_varna.aws_instance.server[1]"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
  Command: `terraform state list`
     ✔  stdout should include "module.consul_sofia.aws_instance.server[1]"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
  Command: `terraform state list`
     ✔  stdout should include "module.consul_varna.aws_instance.server[2]"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
  Command: `terraform state list`
     ✔  stdout should include "module.consul_sofia.aws_instance.server[2]"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
  http GET on http://ec2-52-90-50-47.compute-1.amazonaws.com:8500/ui/sofia/services
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-50-47.compute-1.amazonaws.com:8500/ui/sofia/nodes
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-50-47.compute-1.amazonaws.com:8500/ui/sofia/services/web
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-50-47.compute-1.amazonaws.com:8500/ui/varna/services
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-50-47.compute-1.amazonaws.com:8500/ui/varna/nodes
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-50-47.compute-1.amazonaws.com:8500/ui/varna/services/web
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-147-46.compute-1.amazonaws.com:8500/ui/sofia/services
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-147-46.compute-1.amazonaws.com:8500/ui/sofia/nodes
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-147-46.compute-1.amazonaws.com:8500/ui/sofia/services/web
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-147-46.compute-1.amazonaws.com:8500/ui/varna/services
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-147-46.compute-1.amazonaws.com:8500/ui/varna/nodes
     ✔  status should cmp == 200
  http GET on http://ec2-52-90-147-46.compute-1.amazonaws.com:8500/ui/varna/services/web
     ✔  status should cmp == 200
  http GET on http://ec2-54-174-214-105.compute-1.amazonaws.com:8500/ui/sofia/services
     ✔  status should cmp == 200
  http GET on http://ec2-54-174-214-105.compute-1.amazonaws.com:8500/ui/sofia/nodes
     ✔  status should cmp == 200
  http GET on http://ec2-54-174-214-105.compute-1.amazonaws.com:8500/ui/sofia/services/web
     ✔  status should cmp == 200
  http GET on http://ec2-54-174-214-105.compute-1.amazonaws.com:8500/ui/varna/services
     ✔  status should cmp == 200
  http GET on http://ec2-54-174-214-105.compute-1.amazonaws.com:8500/ui/varna/nodes
     ✔  status should cmp == 200
  http GET on http://ec2-54-174-214-105.compute-1.amazonaws.com:8500/ui/varna/services/web
     ✔  status should cmp == 200

Test Summary: 36 successful, 0 failures, 0 skipped
```
