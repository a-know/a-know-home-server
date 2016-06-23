include_recipe 'yumrepo::stackdriver'

package 'stackdriver-agent'

stackdriver_credentials = Chef::EncryptedDataBagItem.load('credentials', 'stackdriver')

template '/etc/sysconfig/stackdriver' do
  variables stackdriver_apikey: stackdriver_credentials['api_key']
  notifies :restart, 'service[stackdriver-agent]'
end

service 'stackdriver-agent' do
  action [:enable, :start]
  supports restart: true
end
