shared_examples 'docker' do
  describe service 'docker' do
    it { should be_enabled }
    it { should be_running }
  end
end
