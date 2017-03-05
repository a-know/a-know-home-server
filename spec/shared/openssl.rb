shared_examples 'openssl' do
  describe 'openssl' do
    describe file '/usr/local/openssl-1.0.2k/lib/libssl.so' do
      it { should be_file }
    end
  end
  describe command('openssl version') do
    its(:stdout) { should match /1\.0\.2k/ }
  end
end
