include_recipe 'growthforecast'

cookbook_file '/home/a-know/growthforecast/.htpasswd' do
  user     'a-know'
  group    'a-know'
  mode     0644
  source   '.htpasswd'
  notifies :reload, 'service[nginx]'
end
