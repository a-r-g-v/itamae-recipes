remote_file "/etc/ssh/sshd_config" do
  source "sshd_config"
  owner "root"
  group "root"
end

service 'ssh' do
  action [:enable, :restart]
end

