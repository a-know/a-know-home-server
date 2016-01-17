include_recipe 'crond'

cron "Refresh Let's Encrypt cert-file and restart nginx" do
  user 'root'
  command '/usr/local/letsencrypt/letsencrypt-auto certonly --webroot -w /var/www/a-know-home/current/public -d home.a-know.me --renew-by-default && sudo nginx -s reload'
  day '15'
  hour '4'
  minute '00'
end
