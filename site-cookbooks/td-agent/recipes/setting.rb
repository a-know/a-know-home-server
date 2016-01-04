include_recipe 'td-agent'

%w(fluent-plugin-slack).each do |gem|
  gem_package gem do
    gem_binary '/opt/td-agent/embedded/bin/fluent-gem'
    notifies :restart, 'service[td-agent]'
  end
end

template '/etc/td-agent/td-agent.conf' do
  variables knock_url: nil
  source 'td-agent.conf.erb'
  notifies :restart, 'service[td-agent]'
end
