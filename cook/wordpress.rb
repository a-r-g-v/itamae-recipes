include_recipe "../books/nginx-package"
include_recipe "../books/mysql-package"
include_recipe "../books/php5-package"
include_recipe "../books/wordpress"

service 'nginx' do
  action :restart
end
