shared_examples 'newrelic-infrastructure' do
  describe package 'newrelic-infra' do
    it { should be_installed }
  end

  describe service 'newrelic-infra' do
    it { should be_enabled }
    it { should be_running }
  end
end
