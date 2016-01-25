shared_examples 'td-agent' do
  describe package 'td-agent' do
    it { should be_installed }
  end

  describe service 'td-agent' do
    it { should be_enabled }
    it { should be_running }
  end

  describe file '/etc/td-agent/td-agent.conf' do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should include '@include conf.d/*.conf' }
  end

  describe 'Plugins' do
    let(:path) { "/opt/td-agent/embedded/bin:#{ENV['PATH']}" }
    describe package 'fluent-plugin-slack' do
      it { should be_installed.by('gem') }
    end

    describe package 'fluentd-plugin-mackerel' do
      it { should be_installed.by('gem') }
    end

    describe package 'fluent-plugin-datacounter' do
      it { should be_installed.by('gem') }
    end
  end
end