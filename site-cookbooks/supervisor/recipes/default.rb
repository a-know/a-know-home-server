include_recipe 'yumrepo::epel'

package 'supervisor' do
  action :install
  options '--enablerepo=epel'
end

service 'supervisord' do
  action [:enable, :start]
  supports reload: true
end
