include_recipe 'users'

credential_helper_binary = File.join('/usr/bin', 'docker-credential-ecr-login')
docker_config = File.join('/home/a-know/.docker', 'config.json')

# curl -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-Linux-x86_64" > site-cookbooks/docker/files/default/docker-compose
cookbook_file credential_helper_binary do
  mode '0755'
  action :create_if_missing
end

cookbook_file docker_config do
  mode '0600'
  action :create_if_missing
end
