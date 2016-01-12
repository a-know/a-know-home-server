shared_examples 'mackerel' do
  describe package 'mackerel-agent' do
    it { should be_installed }
  end

  describe service 'mackerel-agent' do
    it { should be_enabled }
    it { should be_running }
  end

  describe file '/etc/mackerel-agent/mackerel-agent.conf' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
end