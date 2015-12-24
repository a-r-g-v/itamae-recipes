user "add a_r_g_v" do
  username "a_r_g_v"
end

directory "/home/a_r_g_v/.ssh" do
  mode "775"
  owner "a_r_g_v"
  group "a_r_g_v"
end

execute "download a_r_g_v publickey" do
  user "a_r_g_v"
  command "wget https://github.com/greyia.keys -O /home/a_r_g_v/.ssh/authorized_keys"
end

execute "add sudoers" do
  command "usermod -aG sudo a_r_g_v"
end
 

