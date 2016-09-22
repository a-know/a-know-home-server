shared_examples 'letsencrypt' do
  describe file('/usr/local/bin/certbot') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 755 }
  end
end
