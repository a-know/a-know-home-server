shared_examples 'stackdriver' do
  describe package 'stackdriver-agent' do
    it { should be_installed }
  end

  describe service 'stackdriver-agent' do
    it { should be_enabled }
    it { should_not be_running }
  end
end