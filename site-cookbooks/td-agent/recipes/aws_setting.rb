include_recipe 'td-agent'
data_bag = Chef::EncryptedDataBagItem.load('webhook_urls', 'knock')
mackerel_credentials = Chef::EncryptedDataBagItem.load('credentials', 'mackerel')
color = node[:instance_kind][:color]

%w(
  fluent-plugin-slack
  fluent-plugin-mackerel
  fluent-plugin-forest
  fluent-plugin-record-reformer
  fluent-plugin-bigquery
).each do |gem|
  gem_package gem do
    gem_binary '/opt/td-agent/embedded/bin/fluent-gem'
    notifies :restart, 'service[td-agent]'
  end
end

gem_package 'fluent-plugin-datacounter' do
  gem_binary '/opt/td-agent/embedded/bin/fluent-gem'
  version '0.5.0'
  notifies :restart, 'service[td-agent]'
end

template '/etc/td-agent/td-agent.conf' do
  variables knock_url: data_bag['slack']
  source 'td-agent.conf.erb'
  notifies :restart, 'service[td-agent]'
end

directory '/etc/td-agent/conf.d'

template '/etc/td-agent/conf.d/admin_shitemil_nginx_access_log.conf' do
  variables mackerel_api_key: mackerel_credentials['api_key'], mackerel_service_name: 'a-know_shitemil_works', color: color
  source 'admin_shitemil_nginx_access_log.conf.erb'
  notifies :restart, 'service[td-agent]'
end

template '/etc/td-agent/conf.d/grass_graph_nginx_access_log.conf' do
  variables mackerel_api_key: mackerel_credentials['api_key'], mackerel_service_name: 'grass-graph', color: color
  source 'grass_graph_nginx_access_log.conf.erb'
  notifies :restart, 'service[td-agent]'
end

cookbook_file '/etc/td-agent/conf.d/rails_production_log.conf' do
  source 'rails_production_log.conf'
  notifies :restart, 'service[td-agent]'
end

template '/etc/td-agent/conf.d/bookmark_count.conf' do
  variables mackerel_api_key_old: mackerel_credentials['api_key_old'], mackerel_service_name_old: 'a-know-home', mackerel_api_key: mackerel_credentials['api_key'], mackerel_service_name: 'blog_a-know_me'
  source 'bookmark_count.conf.erb'
  notifies :restart, 'service[td-agent]'
end

template '/etc/td-agent/conf.d/subscriber_count.conf' do
  variables mackerel_api_key_old: mackerel_credentials['api_key_old'], mackerel_service_name_old: 'a-know-home', mackerel_api_key: mackerel_credentials['api_key'], mackerel_service_name: 'blog_a-know_me'
  source 'subscriber_count.conf.erb'
  notifies :restart, 'service[td-agent]'
end

template '/etc/td-agent/conf.d/hatena_star_count.conf' do
  variables mackerel_api_key_old: mackerel_credentials['api_key_old'], mackerel_service_name_old: 'a-know-home', mackerel_api_key: mackerel_credentials['api_key'], mackerel_service_name: 'hatena-status'
  source 'hatena_star_count.conf.erb'
  notifies :restart, 'service[td-agent]'
end

template '/etc/td-agent/conf.d/blog_active_user_number.conf' do
  variables mackerel_api_key_old: mackerel_credentials['api_key_old'], mackerel_service_name_old: 'a-know-home', mackerel_api_key: mackerel_credentials['api_key'], mackerel_service_name: 'blog_a-know_me'
  source 'blog_active_user_number.conf.erb'
  notifies :restart, 'service[td-agent]'
end
