package 'nginx' do
    action :install
end

service 'nginx' do
    action [ :enable, :restart ]
end

remote_file '/etc/nginx/sites-enabled/default' do
    source 'nginx.conf'
    user 'root'
    group 'root'
end
