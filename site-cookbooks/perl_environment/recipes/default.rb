include_recipe 'git'

directory '/usr/local/perlenv'

git '/usr/local/perlenv/.plenv' do
  repository 'git://github.com/tokuhirom/plenv.git'
  reference 'master'
  action :checkout
end
