include_recipe 'pip'
include_recipe 'users'

execute 'pip install awscli' do
  command <<-EOS
  pip install awscli
  EOS
  not_if { File.exists?("/usr/bin/aws") }
end

awscli_credentials = Chef::EncryptedDataBagItem.load('credentials', 'awscli')

template '/home/a-know/.aws/credentials' do
  mode '0600'
  variables aws_access_key_id: awscli_credentials['aws_access_key_id'], aws_secret_access_key: awscli_credentials['aws_secret_access_key']
end
