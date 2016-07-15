include_recipe 'mackerel'

package 'mackerel-check-plugins'

%w(
  /etc/mackerel-agent/conf.d/check-plugins.conf
  /usr/local/bin/dice.rb
  /etc/mackerel-agent/conf.d/host-custom-metric-plugin.conf
).each do |file|
  cookbook_file file do
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, 'service[mackerel-agent]'
  end
end
