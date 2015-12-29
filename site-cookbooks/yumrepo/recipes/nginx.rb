nginx_rpm = File.join('/usr/local/src', 'nginx-release-centos-7-0.el7.ngx.noarch.rpm')

cookbook_file nginx_rpm do
  action :create_if_missing
end

rpm_package 'nginx-release' do
  source nginx_rpm
  action :install
end
