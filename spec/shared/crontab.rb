shared_examples 'crontab' do
  describe cron do
    its(:table) { should match  /mkr throw --service grass-graph/ }
  end
end
