shared_examples 'mackerel' do
  describe package 'mackerel-agent' do
    it { should be_installed }
  end

  describe package 'mackerel-agent-plugins' do
    it { should be_installed }
  end

  describe service 'mackerel-agent' do
    it { should be_enabled }
    it { should be_running }
  end

  describe file '/etc/mackerel-agent/mackerel-agent.conf' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should include 'diagnostic = true'}
  end

  describe 'plugins' do
    describe package 'mackerel-check-plugins' do
      it { should be_installed }
    end

    describe file '/etc/mackerel-agent/conf.d/check-plugins.conf' do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
    end

    describe file '/etc/mackerel-agent/conf.d/mackerel-plugin-fluentd.conf' do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
    end

    describe file '/etc/mackerel-agent/conf.d/mackerel-plugin-nginx.conf' do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
    end

    describe file '/etc/mackerel-agent/conf.d/mackerel-plugin-accesslog.conf' do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
    end

    describe file '/etc/mackerel-agent/instance_meta_data.rb' do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
    end
    
    describe file '/etc/mackerel-agent/mackerel-plugin-linux-lite' do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 755 }
    end
    
    describe file '/etc/mackerel-agent/mackerel-plugin-ntpq' do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 755 }
    end

    describe file '/etc/mackerel-agent/conf.d/metadata-plugins.conf' do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 644 }
    end
  end
end
