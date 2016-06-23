cookbook_file '/etc/yum.repos.d/stackdriver.repo' do
  action :create_if_missing
end
