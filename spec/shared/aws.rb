shared_examples 'aws' do
  describe 'aws' do
    describe file '/usr/bin/aws' do
      it { should be_file }
    end
  end
  describe command('aws --version') do
    its(:stdout) { should match /aws-cli\/1\.11\.82/ }
  end

  describe file '/root/.aws/credentials' do
    it { should be_file }
    it { should be_mode 600 }
  end

  describe file '/root/.aws' do
    it { should be_directory }
    it { should be_owned_by 'a-know' }
    it { should be_grouped_into 'a-know' }
    it { should be_mode 755 }
  end

  describe file '/root/.aws/config' do
    it { should be_file }
    it { should be_mode 600 }
    its(:content) { should include 'ap-northeast-1' }
    its(:content) { should include 'JSON' }
  end
end
