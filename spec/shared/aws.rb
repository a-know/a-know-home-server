shared_examples 'aws' do
  describe 'aws' do
    describe file '/usr/bin/aws' do
      it { should be_file }
    end
  end
  describe command('aws --version') do
    its(:stdout) { should match /aws-cli\/1\.11\.82/ }
  end
end
