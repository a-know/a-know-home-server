shared_examples 'gcc' do
  describe package 'gcc' do
    it { should be_installed }
  end

  describe package 'gcc-c++' do
    it { should be_installed }
  end
end
