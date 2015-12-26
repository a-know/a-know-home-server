service 'firewalld' do
  action [ :disable, :stop ]
end