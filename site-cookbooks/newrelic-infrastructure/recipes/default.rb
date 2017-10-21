include_recipe 'yumrepo::newrelic-infrastructure'

mackerel_credentials = Chef::EncryptedDataBagItem.load('credentials', 'newrelic-infrastructure')

template '/etc/newrelic-infra.yml' do
  owner 'root'
  group 'root'
  mode '0644'
  variables license_key: mackerel_credentials['license_key']
end

execute 'yum cache clear' do
  user 'root'
  command "yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'"
end

yum_package 'newrelic-infra'
