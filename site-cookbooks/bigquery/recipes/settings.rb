credentials = Chef::EncryptedDataBagItem.load('credentials', 'bigquery')

directory '/etc/td-agent/.keys'
directory '/etc/td-agent/settings'

template '/etc/td-agent/.keys/nginx-log-to-bigquery-jsonkey.json' do
  variables private_key_id: credentials['private_key_id'], private_key: credentials['private_key'], client_id: credentials['client_id']
  source 'nginx-log-to-bigquery-jsonkey.json.erb'
end

cookbook_file '/etc/td-agent/settings/nginx_access_log_schema.json' do
  user     'root'
  group    'root'
  mode     0644
  source   'nginx_access_log_schema.json'
end
