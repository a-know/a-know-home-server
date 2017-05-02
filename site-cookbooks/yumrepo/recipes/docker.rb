cookbook_file '/etc/yum.repos.d/docker.repo' do
  action :create_if_missing
end
