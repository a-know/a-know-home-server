include_recipe 'yumrepo::docker'

package 'docker-engine'

service 'docker' do
  action [:enable, :start]
end
