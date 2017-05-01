include_recipe 'pip'
include_recipe 'users'

execute 'pip install awscli' do
  command <<-EOS
  pip install awscli
  EOS
  not_if { File.exists?("/usr/bin/aws") }
end

directory '/root/.aws' do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

awscli_credentials = Chef::EncryptedDataBagItem.load('credentials', 'awscli')

template '/root/.aws/credentials' do
  mode '0600'
  variables aws_access_key_id: awscli_credentials['aws_access_key_id'], aws_secret_access_key: awscli_credentials['aws_secret_access_key']
end

awscli_config = File.join('/root/.aws', 'config')

# curl -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-Linux-x86_64" > site-cookbooks/docker/files/default/docker-compose
cookbook_file awscli_config do
  mode '0600'
  action :create_if_missing
end
