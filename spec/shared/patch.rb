shared_examples 'patch' do
  describe package 'patch' do
    it { should be_installed }
  end
end
