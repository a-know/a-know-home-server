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
    its(:content) { should include '@include /etc/td-agent/conf.d/*.conf' }
  end

  describe file '/etc/td-agent/conf.d/nginx_access_log.conf' do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/td-agent/conf.d/rails_production_log.conf' do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/td-agent/conf.d/bookmark_count.conf' do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/td-agent/conf.d/subscriber_count.conf' do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/td-agent/conf.d/hatena_star_count.conf' do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/td-agent/conf.d/blog_active_user_number.conf' do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe file '/etc/td-agent/conf.d/a_know_activity.conf' do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end

  describe 'Plugins' do
    let(:path) { "/opt/td-agent/embedded/bin:#{ENV['PATH']}" }
    describe package 'fluent-plugin-slack' do
      it { should be_installed.by('gem') }
    end

    describe package 'fluent-plugin-mackerel' do
      it { should be_installed.by('gem') }
    end

    describe package 'fluent-plugin-datacounter' do
      it { should be_installed.by('gem') }
    end

    describe package 'fluent-plugin-forest' do
      it { should be_installed.by('gem') }
    end

    describe package 'fluent-plugin-record-reformer' do
      it { should be_installed.by('gem') }
    end

    describe package 'fluent-plugin-bigquery' do
      it { should be_installed.by('gem') }
    end
  end
end
