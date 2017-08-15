include_recipe 'openssl-devel'
include_recipe 'gettext-devel'
include_recipe 'expat-devel'
include_recipe 'curl-devel'
include_recipe 'perl-extutils'
include_recipe 'zlib::devel'

work_dir = '/usr/local/src'

cookbook_file "#{work_dir}/git-2.14.1.tar.gz" do
  action :create_if_missing
end

bash 'Install git-2.14.1.tar.gz' do
  cwd work_dir
  code <<-EOC
  tar xzf git-2.14.1.tar.gz
  cd git-2.14.1
  make prefix=/usr/local all
  make prefix=/usr/local install
  EOC
  not_if { File.exists?("/usr/local/src/git-2.14.1") }
end
