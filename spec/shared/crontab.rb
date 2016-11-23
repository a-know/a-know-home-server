shared_examples 'crontab' do
  describe cron do
    it { should have_entry('00 4 25 * * /usr/local/bin/certbot/certbot-auto certonly --webroot -w /var/www/a-know-home/shared/public -d a-know.me --renew-by-default --non-interactive && sudo nginx -s reload').with_user('root') }
    it { should have_entry('00 4 15 * * /usr/local/bin/certbot/certbot-auto certonly --webroot -w /var/www/a-know-home/shared/public -d home.a-know.me --renew-by-default --non-interactive && sudo nginx -s reload').with_user('root') }
    it { should have_entry('00 4 10 * * /usr/local/bin/certbot/certbot-auto certonly --webroot -w /var/www/a-know-home/shared/public -d grass-graph.shitemil.works --renew-by-default --non-interactive && sudo nginx -s reload').with_user('root') }
  end
end
