include_recipe 'crond'

cron "Refresh Let's Encrypt cert-file (for a-know.me) and restart nginx" do
  user 'root'
  command '/usr/local/letsencrypt/letsencrypt-auto certonly --webroot -w /var/www/a-know-home/shared/public -d a-know.me --renew-by-default && sudo nginx -s reload'
  day '25'
  hour '4'
  minute '00'
end

cron "Refresh Let's Encrypt cert-file (for home.a-know.me) and restart nginx" do
  user 'root'
  command '/usr/local/letsencrypt/letsencrypt-auto certonly --webroot -w /var/www/a-know-home/shared/public -d home.a-know.me --renew-by-default && sudo nginx -s reload'
  day '15'
  hour '4'
  minute '00'
end

cron "Refresh Let's Encrypt cert-file (for grass-graph.shitemil.works) and restart nginx" do
  user 'root'
  command '/usr/local/letsencrypt/letsencrypt-auto certonly --webroot -w /var/www/a-know-home/shared/public -d grass-graph.shitemil.works --renew-by-default && sudo nginx -s reload'
  day '10'
  hour '4'
  minute '00'
end
