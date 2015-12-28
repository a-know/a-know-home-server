shared_examples 'zlib' do
  describe package 'zlib-devel' do
    it { should be_installed }
  end
end
