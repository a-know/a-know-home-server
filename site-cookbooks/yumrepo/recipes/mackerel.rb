execute 'setup mackerel yum repo' do
  command <<-EOS
  curl -fsSL https://mackerel.io/assets/files/scripts/setup-yum.sh | sh
  EOS
  not_if { File.exists?("/etc/yum.repos.d/mackerel.repo") }
end
