include_recipe 'docker::engine'
include_recipe 'docker::credential_helper'

container_version = '0.0.1'

execute 'docker pull' do
  command <<-EOS
  docker pull 384252233704.dkr.ecr.ap-northeast-1.amazonaws.com/a-know-server-container-app:#{container_version}
  EOS
  not_if "docker images | grep 'a-know-server-container-app'"
end
