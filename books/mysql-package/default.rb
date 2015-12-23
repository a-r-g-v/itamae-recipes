package 'mysql' do
  action :install
end
  
service 'mysql' do
    action [ :enable, :restart ]
end
