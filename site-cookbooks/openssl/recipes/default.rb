include_recipe 'openssl-devel'

package 'openssl'

# yum で入る openssl は古いバージョンのため手動で最新のものと入れ替える
work_dir = '/usr/local/src'
dest_dir = '/usr/local/openssl-1.0.2k'

cookbook_file "#{work_dir}/openssl-1.0.2k.tar.gz" do
  action :create_if_missing
end

bash 'Install openssl-1.0.2k' do
  cwd work_dir
  code <<-EOC
  tar xzf openssl-1.0.2k.tar.gz
  cd openssl-1.0.2k
  export LD_RUN_PATH=#{dest_dir}/lib
  ./config --prefix=#{dest_dir} shared
  make install
  cp /usr/bin/openssl /usr/bin/openssl.old
  sudo rm -f /usr/bin/openssl
  sudo ln -s #{dest_dir}/bin/openssl /usr/bin/openssl
  EOC
  creates "#{dest_dir}/lib/libssl.so"
end
