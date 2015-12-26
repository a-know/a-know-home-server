shared_examples 'sudoers' do
  describe file '/etc/sudoers' do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 440 }
    its(:content) { should match /^%wheel\s+ALL=\(ALL\) NOPASSWD: ALL/ }
    its(:content) { should match /^#Defaults requiretty/ }
  end
end