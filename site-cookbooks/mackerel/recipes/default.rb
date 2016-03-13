include_recipe 'yumrepo::mackerel'

package 'mackerel-agent'
package 'mackerel-agent-plugins'

directory '/etc/mackerel-agent/conf.d'

mackerel_credentials = Chef::EncryptedDataBagItem.load('credentials', 'mackerel')


template '/etc/mackerel-agent/mackerel-agent.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  variables apikey: mackerel_credentials['api_key']
  notifies :restart, 'service[mackerel-agent]'
end

service 'mackerel-agent' do
  action [:enable, :start]
  supports restart: true
end
