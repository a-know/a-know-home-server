shared_examples 'selinux' do
  describe selinux do
    it { should be_permissive }
  end
end
