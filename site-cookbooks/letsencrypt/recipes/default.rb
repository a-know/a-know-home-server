include_recipe 'git'

git '/usr/local/letsencrypt' do
  repository 'https://github.com/letsencrypt/letsencrypt'
  action :checkout
end

directory '/etc/letsencrypt' do
  owner 'root'
  group 'root'
  mode  0755
  action :create
end

directory '/etc/letsencrypt/archive' do
  owner 'root'
  group 'root'
  mode  0700
  action :create
end

directory '/etc/letsencrypt/archive/home.a-know.me' do
  owner 'root'
  group 'root'
  mode  0755
  action :create
end

cookbook_file '/etc/letsencrypt/archive/home.a-know.me/cert1.pem' do
  user     'root'
  group    'root'
  mode     0644
  source   'cert1.pem'
end

cookbook_file '/etc/letsencrypt/archive/home.a-know.me/chain1.pem' do
  user     'root'
  group    'root'
  mode     0644
  source   'chain1.pem'
end

cookbook_file '/etc/letsencrypt/archive/home.a-know.me/fullchain1.pem' do
  user     'root'
  group    'root'
  mode     0644
  source   'fullchain1.pem'
end

cookbook_file '/etc/letsencrypt/archive/home.a-know.me/privkey1.pem' do
  user     'root'
  group    'root'
  mode     0644
  source   'privkey1.pem'
end

directory '/etc/letsencrypt/live' do
  owner 'root'
  group 'root'
  mode  0700
  action :create
end

directory '/etc/letsencrypt/live/home.a-know.me' do
  owner 'root'
  group 'root'
  mode  0755
  action :create
end

link "/etc/letsencrypt/live/home.a-know.me/fullchain.pem" do
  to "/etc/letsencrypt/archive/home.a-know.me/fullchain1.pem"
end

link "/etc/letsencrypt/live/home.a-know.me/privkey.pem" do
  to "/etc/letsencrypt/archive/home.a-know.me/privkey1.pem"
end
