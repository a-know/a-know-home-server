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
end
