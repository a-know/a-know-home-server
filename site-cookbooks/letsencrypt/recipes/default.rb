include_recipe 'git'

git '/usr/local/letsencrypt' do
  repository 'https://github.com/letsencrypt/letsencrypt'
  action :checkout
end