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
  end

  describe file '/etc/nginx/conf.d/home.a-know.me.conf' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/logrotate.d/nginx' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should include 'rotate 10' }
  end
end
