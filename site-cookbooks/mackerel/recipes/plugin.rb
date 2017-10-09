include_recipe 'mackerel'
include_recipe 'perl-json'

package 'mackerel-check-plugins'

cookbook_file '/etc/mackerel-agent/conf.d/check-plugins.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mackerel-agent]'
end

cookbook_file '/etc/mackerel-agent/conf.d/check-plugins.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mackerel-agent]'
end

cookbook_file '/etc/mackerel-agent/conf.d/mackerel-plugin-fluentd.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mackerel-agent]'
end

cookbook_file '/etc/mackerel-agent/conf.d/mackerel-plugin-nginx.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mackerel-agent]'
end

cookbook_file '/etc/mackerel-agent/conf.d/mackerel-plugin-accesslog.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mackerel-agent]'
end

cookbook_file '/etc/mackerel-agent/instance_meta_data.rb' do
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/etc/mackerel-agent/mackerel-plugin-linux-lite' do
  owner 'root'
  group 'root'
  mode '0755'
end

cookbook_file '/etc/mackerel-agent/conf.d/metadata-plugins.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mackerel-agent]'
end
