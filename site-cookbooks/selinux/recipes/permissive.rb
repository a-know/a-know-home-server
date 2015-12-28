execute 'setenforce_permissive' do
  action :nothing
  command <<-EOC
  if [ $(getenforce) != "Disabled" ]; then
    setenforce permissive
  fi
  EOC
end

template '/etc/selinux/config' do
  source "selinux.config.#{node['platform']}.erb"
  variables policy: 'permissive'
  notifies :run, 'execute[setenforce_permissive]'
end
