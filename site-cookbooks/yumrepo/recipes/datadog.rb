cookbook_file '/etc/yum.repos.d/datadog.repo' do
  action :create_if_missing
end
