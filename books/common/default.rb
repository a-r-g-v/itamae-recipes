execute "update" do
  command "apt-get update -u && apt-get upgrade -y"
end

package 'vim' do
  action :install
end

package 'zsh' do
  action :install
end

package 'git' do
  action :install
end

package 'wget' do
  action :install
end

package 'curl' do
  action :install
end

package 'htop' do
  action :intall
end

