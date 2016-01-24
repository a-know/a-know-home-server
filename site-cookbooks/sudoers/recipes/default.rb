include_recipe 'users'

cookbook_file '/etc/sudoers' do
  source "sudoers.#{node['platform']}"
  owner 'root'
  group 'root'
  mode 0440
  action :create
end