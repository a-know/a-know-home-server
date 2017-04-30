include_recipe 'docker::engine'

compose_binary = File.join('/usr/bin', 'docker-compose')

# curl -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-Linux-x86_64" > site-cookbooks/docker/files/default/docker-compose
cookbook_file compose_binary do
  mode '0755'
  action :create_if_missing
end
