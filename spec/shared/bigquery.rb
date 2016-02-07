shared_examples 'bigquery::settings' do
  describe file '/etc/td-agent/.keys/gcp-credential-for-fluentd-jsonkey.json' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should match /"private_key_id": ".+"/ }
    its(:content) { should match /"private_key": "-----BEGIN PRIVATE KEY-----/ }
    its(:content) { should match /"client_id": "\d+"/ }
  end
  describe file '/etc/td-agent/settings/nginx_access_log_schema.json' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
  describe file '/etc/td-agent/settings/rails_production_log_schema.json' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
  describe file '/etc/td-agent/settings/bookmark_count_schema.json' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
  describe file '/etc/td-agent/settings/subscribers_count_schema.json' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
  describe file '/etc/td-agent/settings/hatena_star_count_schema.json' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
  describe file '/etc/td-agent/settings/active_visitors_count_schema.json' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
  describe file '/etc/td-agent/settings/steps_schema.json' do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
end
