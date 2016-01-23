shared_examples 'supervisor' do
  describe package 'supervisor' do
    it { should be_installed }
  end

  describe service 'supervisord' do
    it { should be_enabled }
    it { should be_running }
  end
end
