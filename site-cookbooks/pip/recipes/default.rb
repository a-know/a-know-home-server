get_pip_script = File.join('/tmp', 'get-pip.py')

# url "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
cookbook_file get_pip_script do
  mode '0755'
  action :create_if_missing
end

execute 'python /tmp/get-pip.py' do
  command <<-EOS
  python /tmp/get-pip.py
  EOS
  not_if { File.exists?("/usr/bin/pip") }
end
