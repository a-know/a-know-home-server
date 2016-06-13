shared_examples 'datadog' do
  describe package 'datadog-agent' do
    it { should be_installed }
  end
end
