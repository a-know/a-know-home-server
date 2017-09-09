include_recipe 'yumrepo::nginx'

package 'nginx'

service 'nginx' do
  action [:enable, :start]
  supports reload: true
end

%w(default.conf example_ssl.conf).each do |file|
  file "/etc/nginx/conf.d/#{file}" do
    action :delete
    notifies :reload, 'service[nginx]'
  end
end

cookbook_file '/etc/nginx/nginx.conf' do
  user     'root'
  group    'root'
  mode     0644
  source   'nginx.conf'
  notifies :reload, 'service[nginx]'
end

template '/etc/nginx/conf.d/a-know.shitemil.works.conf' do
  user     'root'
  group    'root'
  mode     0644
  notifies :reload, 'service[nginx]'
end

template '/etc/nginx/conf.d/a-know.moshimo.works.conf' do
  user     'root'
  group    'root'
  mode     0644
  notifies :reload, 'service[nginx]'
end

template '/etc/nginx/conf.d/grass-graph.shitemil.works.conf' do
  user     'root'
  group    'root'
  mode     0644
  notifies :reload, 'service[nginx]'
end

template '/etc/nginx/conf.d/grass-graph.moshimo.works.conf' do
  user     'root'
  group    'root'
  mode     0644
  notifies :reload, 'service[nginx]'
end

include_recipe 'nginx::logrotate'
