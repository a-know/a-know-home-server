include_recipe 'users'

directory '/home/a-know/growthforecast' do
  owner 'a-know'
  group 'a-know'
  mode  0755
  action :create
end

cookbook_file '/home/a-know/growthforecast/cpanfile' do
  owner 'a-know'
  group 'a-know'
  mode 0644
end

# rrdtool dependencies
package 'pkgconfig'
package 'glib2-devel'
package 'gettext'
package 'libxml2-devel'
package 'pango-devel'
package 'cairo-devel'


execute 'GrowthForecast install' do
  user 'a-know'
  group 'a-know'
  environment ({'HOME' => "/home/a-know", 'USER' => 'a-know'})
  command <<-EOC
   export PATH=$HOME/.plenv/bin:$PATH
   eval "$(plenv init -)"
   cd $HOME/growthforecast
   plenv exec carton install
  EOC
  creates '/home/a-know/growthforecast/local/bin/growthforecast.pl'
end