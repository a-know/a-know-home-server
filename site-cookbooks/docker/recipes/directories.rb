[
  '/var/www/',
  '/var/www/a-know-home',
  '/var/www/a-know-home/shared',
  '/var/www/a-know-home/shared/log',
  '/var/www/a-know-home/shared/public',
  '/var/www/a-know-home/shared/tmp',
].each do |dir|
  directory dir do
    owner 'a-know'
    group 'a-know'
    mode 0755
    action :create
  end
end

[
  '/var/www/a-know-home/shared/current',
].each do |dir|
  directory dir do
    owner 'a-know'
    group 'a-know'
    mode 0777
    action :create
  end
end
