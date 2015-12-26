shared_examples 'firewalld::disable' do
  describe service 'firewalld' do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end