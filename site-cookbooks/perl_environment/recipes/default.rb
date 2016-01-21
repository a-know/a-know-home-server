include_recipe 'git'
include_recipe 'users'
include_recipe 'sudoers'

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
  not_if "grep 'PATH=/home/a-know/.plenv/bin' /home/a-know/.bash_profile"
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

execute 'Install perl-5.22.1' do
  user 'a-know'
  group 'a-know'
  environment ({'HOME' => "/home/a-know", 'USER' => 'a-know'})
  command <<-EOC
   export PATH=/home/a-know/.plenv/bin:$PATH
   eval "$(plenv init -)"
   plenv install 5.22.1 -Dusethreads
   plenv global 5.22.1
   plenv rehash
  EOC
  creates '/home/a-know/.plenv/versions/5.22.1'
end

package 'perl-ExtUtils-Manifest'
package 'perl-Data-Dumper'

execute 'Install cpanm' do
  user 'a-know'
  group 'a-know'
  environment ({'HOME' => "/home/a-know", 'USER' => 'a-know'})
  command <<-EOC
   export PATH=$HOME/.plenv/bin:$PATH
   eval "$(plenv init -)"
   plenv install-cpanm
  EOC
  creates '/home/a-know/.plenv/versions/5.22.1/bin/cpanm'
end

execute 'Install carton' do
  user 'a-know'
  group 'a-know'
  environment ({'HOME' => "/home/a-know", 'USER' => 'a-know'})
  command <<-EOC
   export PATH=$HOME/.plenv/bin:$PATH
   eval "$(plenv init -)"
   plenv exec cpanm Carton
  EOC
  creates '/home/a-know/.plenv/versions/5.22.1/bin/carton'
end
