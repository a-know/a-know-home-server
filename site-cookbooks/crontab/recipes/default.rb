include_recipe 'crond'
data_bag = Chef::EncryptedDataBagItem.load('webhook_urls', 'knock')
mackerel_credentials = Chef::EncryptedDataBagItem.load('credentials', 'mackerel')

cron "Refresh Let's Encrypt cert-file (for grass-graph.shitemil.works and a-know.shitemil.works)" do
  user 'root'
  command '/usr/local/bin/certbot/certbot-auto certonly --webroot -w /var/www/a-know-home/shared/public -d grass-graph.shitemil.works -d a-know.shitemil.works --renew-by-default --non-interactive'
  day '10'
  hour '4'
  minute '00'
end

cron "Post service metric for grass--graph generated image count" do
  user 'root'
  echo_cmd = 'echo -e "grass-graph.images.count\t$(ls -1 /var/www/a-know-home/shared/tmp/gg_others_svg/${d} | wc -l)\t$(date -u +\\%s)"'
  command "export MACKEREL_APIKEY=#{mackerel_credentials['api_key']} && d=`date '+\\%Y-\\%m-\\%d'` && #{echo_cmd} | /usr/local/bin/mkr throw --service grass-graph"
  minute '*/15'
end
