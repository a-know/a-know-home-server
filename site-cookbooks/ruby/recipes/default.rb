include_recipe 'libyaml'

version        = node[:ruby][:version]
distro_version = node[:platform_version] =~ /\A7\./ ? 'el7.centos' : 'el6'

raise "Specified invalid ruby.version #{version}" if version == '0.0.0'

if version =~ /\A2\.1/
  ruby_rpm = "ruby-#{version}-2.#{distro_version}.x86_64.rpm"
else
  ruby_rpm = "ruby-#{version}-1.#{distro_version}.x86_64.rpm"
end
ruby_rpm_full_path = "/var/tmp/#{ruby_rpm}"

remote_file ruby_rpm_full_path do
  source "https://github.com/feedforce/ruby-rpm/releases/download/#{version}/#{ruby_rpm}"
  checksum node[:ruby][:checksum]
end

rpm_package 'ruby' do
  source ruby_rpm_full_path
end

gem_package 'bundler'