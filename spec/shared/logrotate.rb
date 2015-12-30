shared_examples 'logrotate' do
  describe file '/etc/logrotate.d/app' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should_not include 'copytruncate' }
  end
end
