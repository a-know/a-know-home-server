include_recipe 'users'
include_recipe 'perl_environment'

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

execute 'start GrowthForecast' do
  user 'a-know'
  group 'a-know'
  environment ({'HOME' => "/home/a-know", 'USER' => 'a-know'})
  command <<-EOC
    export PATH=$HOME/.plenv/bin:$PATH
    eval "$(plenv init -)"
    plenv exec carton exec -- perl local/bin/growthforecast.pl --data-dir /home/a-know/growthforecast &
  EOC
  not_if "ps aux | grep 'GrowthForecast::Web' | grep -v 'grep'"
end
