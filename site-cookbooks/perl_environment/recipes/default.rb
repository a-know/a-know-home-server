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
