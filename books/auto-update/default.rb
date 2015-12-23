
package 'unattended-upgrades' do
  action :install
end

# only security update

file '/etc/apt/apt.conf.d/20auto-upgrades' do
  content <<-"EOF"
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
  EOF
end
