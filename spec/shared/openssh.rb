shared_examples 'openssh' do
  describe file '/etc/ssh/sshd_config' do
    its(:content) { should match /^PermitRootLogin no/ }
    its(:content) { should match /^PasswordAuthentication no/ }
  end
end
