include_recipe 'td-agent'
data_bag = Chef::EncryptedDataBagItem.load('webhook_urls', 'knock')
mackerel_credentials = Chef::EncryptedDataBagItem.load('credentials', 'mackerel')


%w(
  fluent-plugin-slack
  fluent-plugin-mackerel
  fluent-plugin-datacounter
  fluent-plugin-forest
  fluent-plugin-record-reformer
  fluent-plugin-bigquery
).each do |gem|
  gem_package gem do
    gem_binary '/opt/td-agent/embedded/bin/fluent-gem'
    notifies :restart, 'service[td-agent]'
  end
end

template '/etc/td-agent/td-agent.conf' do
  variables knock_url: data_bag['slack']
  source 'td-agent.conf.erb'
  notifies :restart, 'service[td-agent]'
end

directory '/etc/td-agent/conf.d'

template '/etc/td-agent/conf.d/nginx_access_log.conf' do
  variables mackerel_api_key: mackerel_credentials['api_key'], mackerel_service_name: 'a-know-home'
  source 'nginx_access_log.conf.erb'
  notifies :restart, 'service[td-agent]'
end
