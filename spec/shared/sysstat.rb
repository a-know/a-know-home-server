shared_examples 'sysstat' do
  describe package 'sysstat' do
    it { should be_installed }
  end
end
