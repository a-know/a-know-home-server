shared_examples 'stackdriver' do
  describe package 'stackdriver-agent' do
    it { should be_installed }
  end

  describe service 'stackdriver-agent' do
    it { should be_enabled }
    it { should be_running }
  end

  describe file '/etc/sysconfig/stackdriver' do
    its(:content) { should match /^STACKDRIVER_API_KEY=".+"$/ }
  end
end