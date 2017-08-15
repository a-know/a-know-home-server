shared_examples 'git' do
  describe command('git version') do
    its(:stdout) { should match /2\.14\.1/ }
  end
end
