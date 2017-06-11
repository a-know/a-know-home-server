shared_examples 'crontab' do
  describe cron do
    its(:table) { should match  /mkr throw --service grass-graph/ }
    its(:table) { should match  /td-agent restart/ }
  end
end
