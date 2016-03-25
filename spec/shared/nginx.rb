shared_examples 'nginx' do
  describe service 'nginx' do
    it { should be_enabled }
    it { should be_running }
  end

  describe file '/etc/nginx/nginx.conf' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should match /open_file_cache .+;/ }
    its(:content) { should include 'open_file_cache_errors on;' }
  end

  describe file '/etc/nginx/conf.d/a-know.me.conf' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should include 'ssl_prefer_server_ciphers on' }
    its(:content) { should include 'ssl_protocols TLSv1 TLSv1.1 TLSv1.2' }
  end

  describe file '/etc/nginx/conf.d/home.a-know.me.conf' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should include '80 default_server' }
    its(:content) { should include 'ssl_prefer_server_ciphers on' }
    its(:content) { should include 'ssl_protocols TLSv1 TLSv1.1 TLSv1.2' }
  end

  describe file '/etc/nginx/conf.d/grass-graph.shitemil.works.conf' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should match /listen\s+80;/ } # not default server
    its(:content) { should include 'ssl_prefer_server_ciphers on' }
    its(:content) { should include 'ssl_protocols TLSv1 TLSv1.1 TLSv1.2' }
    its(:content) { should include 'add_header Strict-Transport-Security "max-age=2592000; includeSubdomains"' }
  end

  describe file '/etc/logrotate.d/nginx' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should include 'rotate 10' }
  end
end
