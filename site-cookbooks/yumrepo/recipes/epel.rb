include_recipe 'nss'

epel_repo = '/etc/yum.repos.d/epel.repo'

package 'epel-release'

execute 'epel.repo enabled=0' do
  action :run
  command <<-EOS
  sed -i 's/enabled=1/enabled=0/g' #{epel_repo}
  EOS
  only_if { File.read(epel_repo) =~ /enabled=1/ }
end
