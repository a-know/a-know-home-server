include_recipe 'yumrepo::datadog'

package 'datadog-agent'

datadog_credentials = Chef::EncryptedDataBagItem.load('credentials', 'datadog')


template '/etc/dd-agent/datadog.conf' do
  owner 'dd-agent'
  group 'root'
  mode '0640'
  variables datadog_apikey: datadog_credentials['api_key'], datadog_hostname: 'home.a-know.me'
  notifies :restart, 'service[datadog-agent]'
end

service 'datadog-agent' do
  action [:enable, :start]
  supports restart: true
end
