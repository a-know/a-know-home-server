include_recipe 'td-agent'
data_bag = Chef::EncryptedDataBagItem.load('webhook_urls', 'knock')


%w(fluent-plugin-slack fluentd-plugin-mackerel fluent-plugin-datacounter).each do |gem|
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
