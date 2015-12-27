service 'sshd' do
  supports status: true, restart: true, reload: true
  action [ :enable, :start ]
end

template '/etc/ssh/sshd_config' do
  source "sshd_config.#{node['platform']}.erb"
  notifies :reload, 'service[sshd]'
end
