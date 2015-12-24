

package 'mysql-server' do
  action :install
end

package 'mysql-client' do
  action :install
end

service 'mysql' do
  action [ :enable, :restart ]
end

# ref: http://qiita.com/kotanbo/items/263841bae08044676c83
execute "mysql_secure_installation" do
  user "root"
  command <<-EOF
    mysqladmin -u root password "#{node["mysql"]["password"]}"
    mysql -u root -p#{node["mysql"]["password"]} -e "DELETE FROM mysql.user WHERE User='';"
    mysql -u root -p#{node["mysql"]["password"]} -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1');"
    mysql -u root -p#{node["mysql"]["password"]} -e "DROP DATABASE test;"
    mysql -u root -p#{node["mysql"]["password"]} -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
    mysql -u root -p#{node["mysql"]["password"]} -e "FLUSH PRIVILEGES;"
  EOF

end

