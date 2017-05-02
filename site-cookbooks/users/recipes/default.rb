data_ids = data_bag('users')

groups = {}

data_ids.each do |id|
  u = data_bag_item('users', id)
  user u['uid'] do
    gid u['gid'] unless u['uid'] == u['gid']
    password u['password']
    home u['home']
    shell u['shell']
  end

  (u['groups'] || []).each do |name|
    groups[name] ||= []
    groups[name] << u['uid']
  end

  directory u['home'] do
    owner u['uid']
    group u['gid']
    mode 0755
    action :create
  end

  next unless u['authorized_keys']

  [ "#{u['home']}/.ssh" ].each do |dir|
    directory dir do
      owner u['uid']
      group u['gid']
      mode 0755
      action :create
    end
  end

  file "#{u['home']}/.ssh/authorized_keys" do
    content u['authorized_keys'].join("\n")
    owner u['uid']
    group u['gid']
    mode 0600
    action :create
  end
end

groups.each do |name, members|
  group name do
    members members
    action :manage
  end
end
