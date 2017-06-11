include_recipe 'crond'
mackerel_credentials = Chef::EncryptedDataBagItem.load('credentials', 'mackerel')
color = node[:instance_kind][:color]

cron "Post service metric for grass--graph generated image count" do
  user 'root'
  echo_cmd = 'echo -e "grass-graph.' + color + '.images.count\t$(ls -1 /var/www/a-know-home/shared/tmp/gg_others_svg/${d} | wc -l)\t$(date -u +\\%s)"'
  command "export MACKEREL_APIKEY=#{mackerel_credentials['api_key']} && d=`date '+\\%Y-\\%m-\\%d'` && #{echo_cmd} | /usr/local/bin/mkr throw --service grass-graph"
  minute '*/15'
end

cron "Restart fluentd regularly" do
  user 'root'
  command "/etc/init.d/td-agent restart"
  day  '*/4'
  hour '21'
end
