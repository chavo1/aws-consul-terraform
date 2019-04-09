describe command('terraform state list') do
  its('stdout') { should include "module.consul_varna.aws_instance.server[0]" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_sofia.aws_instance.server[0]" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_varna.aws_instance.server[1]" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_sofia.aws_instance.server[1]" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_varna.aws_instance.server[2]" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_sofia.aws_instance.server[2]" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
