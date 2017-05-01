shared_examples 'docker' do
  describe service 'docker' do
    it { should be_enabled }
    it { should be_running }
  end

  describe file '/usr/bin/docker-compose' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 755 }
  end

  describe file '/usr/bin/docker-credential-ecr-login' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 755 }
  end

  describe file '/root/.docker' do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 755 }
  end

  describe file '/root/.docker/config.json' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should include '"credsStore": "ecr-login"' }
    it { should be_mode 600 }
  end

  describe command('docker images') do
    its(:stdout) { should match /384252233704\.dkr\.ecr\.ap-northeast-1\.amazonaws\.com\/a-know-server-container-app/ }
  end

  [
    '/var/www/',
    '/var/www/a-know-home',
    '/var/www/a-know-home/shared',
    '/var/www/a-know-home/shared/log',
    '/var/www/a-know-home/shared/public',
    '/var/www/a-know-home/shared/tmp',
  ].each do |dir|
    describe file dir do
      it { should be_directory }
      it { should be_owned_by 'a-know' }
      it { should be_grouped_into 'a-know' }
      it { should be_mode 755 }
    end
  end

  [
    '/var/www/a-know-home/shared/current',
  ].each do |dir|
    describe file dir do
      it { should be_directory }
      it { should be_owned_by 'a-know' }
      it { should be_grouped_into 'a-know' }
      it { should be_mode 777 }
    end
  end
end
