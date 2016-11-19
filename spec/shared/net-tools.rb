shared_examples 'net-tools' do
  describe package 'net-tools' do
    it { should be_installed }
  end
end
