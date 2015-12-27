hostname = node[:hostname_attr][:hostname]

raise 'hostname is required' unless hostname

if node[:platform_version] =~ /\A7\./
  file '/etc/hostname' do
    content "#{hostname}\n"
    notifies :run, 'execute[run hostnamectl]'
  end

  execute 'run hostnamectl' do
    command "hostnamectl set-hostname #{hostname}"
    action :nothing
  end
else
  bash 'update hostname' do
    hostname_regexp = Regexp.escape(hostname)
    code <<-EOC
      sed -i -e 's/\\(HOSTNAME=\\).*/\\1#{hostname_regexp}/' /etc/sysconfig/network
      hostname #{hostname}
    EOC
    not_if "grep -e '^HOSTNAME=#{hostname_regexp}$' /etc/sysconfig/network"
  end
end

template '/etc/profile.d/network.sh' do
  variables ps1: node[:hostname_attr][:ps1]
  action :create
end
