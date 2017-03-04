shared_examples 'crontab' do
  describe cron do
    echo_cmd = 'echo -e "grass-graph.images.count\t$(ls -1 /var/www/a-know-home/shared/tmp/gg_others_svg/${d} | wc -l)\t$(date -u +\\%s)"'
    it { should have_entry("*/15 * * * * export MACKEREL_APIKEY=#{ENV['NEW_MACKEREL_APIKEY']} && d=`date '+\\%Y-\\%m-\\%d'` && #{echo_cmd} | /usr/local/bin/mkr throw --service grass-graph").with_user('root') }
  end
end
