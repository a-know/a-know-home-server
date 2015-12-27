shared_examples 'chrony' do
  describe service 'chronyd' do
    it { should be_enabled }
    it { should be_running }
  end

  describe service 'ntpd' do
    it { should_not be_running }
  end
end