require 'spec_helper'

ssh_key_ogonna = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1dZw1rcvBElYXHhEfqphmtJ48Do+q05EO3p4RWvTI0YZcOw4ly4lUr/eR1pY9vDTDXcRUlt7FUrwgraqOtuiEZgFVbv+QQPlKXtkqzTkqy/HCAgDaB8vRdMaTk6QGQTBybXe6k6BZKpcaFwxPUmO127SegWbqnp4x/gGqfjY9W5FqBdPF3LNAZi/TJ9pWmO2vNrwhRvhmIX4zLI+pDGjNeRO01uk0No9z52lJgXcBAqb9Pn8TbEhPJZIdkvjVbFKQlZTjW4X47zNQ7CuCrbG2HuCcM3wqMETqBaZDO36j06Ehf3nWeqUC7lI9RHT0lxl0LkxedZbTshgf2ZbQtQp3'

describe user('ogonna') do
  it { should exist }
  it { should belong_to_group 'devops' }
  it { should belong_to_primary_group 'ogonna' }
  it { should have_home_directory '/home/ogonna' }
  it { should have_login_shell '/bin/bash' }
  it { should have_authorized_key ssh_key_ogonna }
end

describe user('adaku') do
  it { should exist }
  it { should belong_to_group 'devops' }
  it { should belong_to_primary_group 'adaku' }
  it { should have_home_directory '/home/adaku' }
  it { should have_login_shell '/bin/bash' }
end

describe user('chika') do
  it { should_not exist }
end

describe file('/etc/sudoers.d/10_custom') do
  it { should be_file }
  it { should be_mode 440 }
  it { should be_owned_by 'root' }
end

describe command('su ogonna -c "sudo touch /root/testfile"') do
  its(:exit_status) { should eq 0 }
end
