shared_examples 'crond' do
  describe service 'crond' do
    it { should be_enabled }
    it { should be_running }
  end
end
