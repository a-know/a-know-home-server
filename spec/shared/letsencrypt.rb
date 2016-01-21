shared_examples 'letsencrypt' do
  describe file('/usr/local/letsencrypt') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 755 }
  end

  describe file '/etc/letsencrypt/archive/home.a-know.me/cert1.pem' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/letsencrypt/archive/home.a-know.me/chain1.pem' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/letsencrypt/archive/home.a-know.me/fullchain1.pem' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/letsencrypt/archive/home.a-know.me/privkey1.pem' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
end
