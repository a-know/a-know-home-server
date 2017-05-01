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
end
