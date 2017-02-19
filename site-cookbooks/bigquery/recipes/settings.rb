include_recipe 'td-agent'

credentials = Chef::EncryptedDataBagItem.load('credentials', 'bigquery')

directory '/etc/td-agent/.keys'
directory '/etc/td-agent/settings'

template '/etc/td-agent/.keys/gcp-credential-for-fluentd-jsonkey.json' do
  variables private_key_id: credentials['private_key_id'],
            private_key: credentials['private_key'],
            client_id: credentials['client_id'],
            client_email: credentials['client_email'],
            client_x509_cert_url: credentials['client_x509_cert_url']
  source 'gcp-credential-for-fluentd-jsonkey.json.erb'
end

cookbook_file '/etc/td-agent/settings/nginx_access_log_schema.json' do
  user     'root'
  group    'root'
  mode     0644
  source   'nginx_access_log_schema.json'
end

cookbook_file '/etc/td-agent/settings/rails_production_log_schema.json' do
  user     'root'
  group    'root'
  mode     0644
  source   'rails_production_log_schema.json'
end

cookbook_file '/etc/td-agent/settings/bookmark_count_schema.json' do
  user     'root'
  group    'root'
  mode     0644
  source   'bookmark_count_schema.json'
end

cookbook_file '/etc/td-agent/settings/subscribers_count_schema.json' do
  user     'root'
  group    'root'
  mode     0644
  source   'subscribers_count_schema.json'
end

cookbook_file '/etc/td-agent/settings/hatena_star_count_schema.json' do
  user     'root'
  group    'root'
  mode     0644
  source   'hatena_star_count_schema.json'
end

cookbook_file '/etc/td-agent/settings/active_visitors_count_schema.json' do
  user     'root'
  group    'root'
  mode     0644
  source   'active_visitors_count_schema.json'
end
