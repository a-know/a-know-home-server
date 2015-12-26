
include_recipe 'crond'
include_recipe 'rsyslog'

zone = node[:timezone][:zone]

if node[:platform_version] =~ /\A7\./
  link '/etc/localtime' do
    to "/usr/share/zoneinfo/#{zone}"
    notifies :restart, 'service[crond]', :immediately
    notifies :restart, 'service[rsyslog]'
  end
else
  source = "/usr/share/zoneinfo/#{zone}"
  dest   = '/etc/localtime'

  template '/etc/sysconfig/clock' do
    variables zone: zone
    notifies :run, 'execute[update timezone]'
  end

  execute 'update timezone' do
    action :run
    command "/usr/sbin/tzdata-update"
    not_if { ::FileUtils.identical?(source, dest) }
    notifies :restart, 'service[crond]', :immediately
    notifies :restart, 'service[rsyslog]'
  end
end