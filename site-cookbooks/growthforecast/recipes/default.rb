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
