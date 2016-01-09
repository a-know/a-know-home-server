shared_examples 'mkswap' do
  describe command "free | grep 'Swap:'" do
    its(:stdout) { should match /Swap:\s+[1-9][0-9]+.+/ }
  end
end