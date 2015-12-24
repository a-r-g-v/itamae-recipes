package 'iptables-persistent' do
  action :install
end

remote_file "/tmp/iptables.sh" do
    source "iptables.sh"
end

execute "run iptables" do
    command "bash /tmp/iptables.sh"
end


