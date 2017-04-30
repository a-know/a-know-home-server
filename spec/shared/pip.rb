shared_examples 'pip' do
  describe 'pip' do
    describe file '/usr/bin/pip' do
      it { should be_file }
    end
  end
  describe command('pip -V') do
    its(:stdout) { should match /pip 9\.0\.1/ }
  end
end
