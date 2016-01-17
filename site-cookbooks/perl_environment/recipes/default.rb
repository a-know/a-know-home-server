include_recipe 'git'

directory '/usr/local/perlenv'
user = node[:perlenv][:user]

git '/usr/local/perlenv/.plenv' do
  repository 'git://github.com/tokuhirom/plenv.git'
  reference 'master'
  action :checkout
end

bash 'export plenv path' do
  code <<-EOS
  echo "export PATH=/usr/local/perlenv/.plenv/bin:$PATH" >> /home/#{user}/.bash_profile
  echo 'eval "$(plenv init -)"' >> /home/#{user}/.bash_profile
  source /home/#{user}/.bash_profile
  EOS
  not_if "grep '/usr/local/perlenv/.plenv/bin' /home/#{user}/.bash_profile"
end

directory '/usr/local/perlenv/.plenv/plugins' do
  owner 'root'
  group 'root'
  mode  0755
  action :create
end

git '/usr/local/perlenv/.plenv/plugins/perl-build' do
  repository 'git://github.com/tokuhirom/Perl-Build.git'
  reference 'master'
  action :checkout
end