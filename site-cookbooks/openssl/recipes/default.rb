include_recipe 'openssl-devel'

work_dir = '/usr/local/src'
dest_dir = '/usr/local/openssl-1.0.2h'

cookbook_file "#{work_dir}/openssl-1.0.2h.tar.gz" do
  action :create_if_missing
end

bash 'Install openssl-1.0.2h' do
  cwd work_dir
  code <<-EOC
  tar xzf openssl-1.0.2h.tar.gz
  cd openssl-1.0.2h
  export LD_RUN_PATH=#{dest_dir}/lib
  ./config --prefix=#{dest_dir} shared
  make install
  cp /usr/bin/openssl /usr/bin/openssl.old
  rm -f /usr/bin/openssl
  ln -s #{dest_dir}/bin/openssl /usr/bin/openssl
  EOC
  creates "#{dest_dir}/lib/libssl.so"
end
