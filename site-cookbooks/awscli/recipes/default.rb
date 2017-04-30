include_recipe 'pip'

execute 'pip install awscli' do
  command <<-EOS
  pip install awscli
  EOS
  not_if { File.exists?("/usr/bin/aws") }
end
