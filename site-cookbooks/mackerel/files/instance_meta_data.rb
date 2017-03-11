require 'json'

ip_addr = `curl -Ssq http://169.254.169.254/latest/meta-data/public-ipv4`
puts [ { name: "public_ip_addr", value: ip_addr } ].to_json
