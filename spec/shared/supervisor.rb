shared_examples 'supervisor' do
  describe package 'supervisor' do
    it { should be_installed }
  end
end
