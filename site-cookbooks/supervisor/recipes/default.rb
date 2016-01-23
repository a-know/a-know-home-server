include_recipe 'yumrepo::epel'

package 'supervisor' do
  action :install
  options '--enablerepo=epel'
end
