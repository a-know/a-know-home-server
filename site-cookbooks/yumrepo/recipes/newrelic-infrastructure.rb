cookbook_file '/etc/yum.repos.d/newrelic-infra.repo' do
  action :create_if_missing
end
