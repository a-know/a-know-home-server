include_recipe 'mackerel'

package 'mackerel-check-plugins'

cookbook_file '/etc/mackerel-agent/conf.d/check-plugins.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mackerel-agent]'
end

cookbook_file '/usr/local/bin/dice.rb' do
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[mackerel-agent]'
end
