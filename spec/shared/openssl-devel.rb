shared_examples 'openssl-devel' do
  describe package 'openssl-devel' do
    it { should be_installed }
  end
end
