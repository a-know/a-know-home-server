shared_examples 'datadog' do
  describe package 'datadog-agent' do
    it { should be_installed }
  end

  describe service 'datadog-agent' do
    it { should be_enabled }
    it { should be_running }
  end

  describe file '/etc/dd-agent/datadog.conf' do
    it { should be_file }
    it { should be_owned_by 'dd-agent' }
    it { should be_grouped_into 'root' }
    it { should be_mode 640 }
    its(:content) { should match /^api_key:\s.{5,}$/ }
    its(:content) { should match /^hostname: home.a-know.me/ }
  end
end
