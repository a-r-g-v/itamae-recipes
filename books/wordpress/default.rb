directory 'create wordpress dir' do
  action :create
  path "/public_html/"
  mode "755"
  owner "www-data"
  group "www-data"
end

execute "wget wordpress" do
    command "wget https://ja.wordpress.org/latest-ja.tar.gz"
    user "www-data"
    cwd "/public_html/"
end

execute "decomporess wordpress" do
    command "tar zxvf latest-ja.tar.gz"
    user "www-data"
    cwd "/public_html/"
end

remote_file "/etc/nginx/sites-enabled/wordpress" do
  source 'wordpress.conf'
end

