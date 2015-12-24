package 'nginx' do
    action :install
end

remote_file '/etc/nginx/nginx.conf' do
    source 'nginx.conf'
    user 'root'
    group 'root'
end

execute 'remove default files' do
  command 'rm /etc/nginx/sites-enabled/default'
end

service 'nginx' do
    action [ :enable, :restart ]
end


