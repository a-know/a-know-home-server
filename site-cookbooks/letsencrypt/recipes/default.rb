include_recipe 'git'

git '/usr/local/bin/certbot' do
  repository 'https://github.com/certbot/certbot'
  action :checkout
end
