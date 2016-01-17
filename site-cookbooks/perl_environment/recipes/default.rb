include_recipe 'git'

git '/home/a-know/.plenv' do
  repository 'git://github.com/tokuhirom/plenv.git'
  user 'a-know'
  group 'a-know'
  reference 'master'
  action :checkout
end

execute 'export plenv path' do
  user 'a-know'
  environment ({'HOME' => "/home/a-know", 'USER' => 'a-know'})
  command <<-EOC
  echo "export PATH=/home/a-know/.plenv/bin:$PATH" >> /home/a-know/.bash_profile
  echo 'eval "$(plenv init -)"' >> /home/a-know/.bash_profile
  source /home/a-know/.bash_profile
  EOC
  not_if "grep 'PATH=/home/a-know/.plenv/bin:$PATH' /home/a-know/.bash_profile"
end

directory '/home/a-know/.plenv/plugins' do
  owner 'a-know'
  group 'a-know'
  mode  0755
  action :create
end

git '/home/a-know/.plenv/plugins/perl-build' do
  user 'a-know'
  group 'a-know'
  repository 'git://github.com/tokuhirom/Perl-Build.git'
  reference 'master'
  action :checkout
end