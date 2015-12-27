shared_examples 'hostname' do
  describe file '/etc/hostname' do
    its(:content) { should include 'centrage' }
  end

  describe file '/etc/profile.d/network.sh' do
    its(:content) { should include 'PS1=' }
  end
end