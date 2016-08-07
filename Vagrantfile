# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-7.1"
  config.ssh.insert_key = false

  config.vm.define 'web' do |web|
    web.vm.network 'private_network', ip: '192.168.33.10'
    web.cache.scope = :box if Vagrant.has_plugin? 'vagrant-cachier'
  end

  config.vm.define :gcp do |gcp|
    gcp.vm.box = "gce"
    gcp.vm.box_url = "https://github.com/mitchellh/vagrant-google/raw/master/google.box"
    gcp.vm.synced_folder ".", "/vagrant", disabled: true

    gcp.vm.provider :google do |google, override|
      google.google_project_id = ENV['GCP_PROJECT_ID']
      google.google_client_email = ENV['GCP_EMAIL']
      google.google_json_key_location = ENV['GCP_KEY_LOCATION']

      google.name = "ci-instance-#{Time.new.to_i}"
      google.zone = "us-central1-f"
      google.machine_type = "n1-standard-2"

      google.image = "centos-7-v20151104"
      google.disk_size = "10"

      google.preemptible = false
      google.on_host_maintenance = "TERMINATE"

      google.auto_restart = false

      override.ssh.username = 'circleci'
      override.ssh.private_key_path = '~/.ssh/id_a-know-home-circleci'
      override.ssh.pty = true
    end

    gcp.vm.provision "shell", inline: <<-SHELL
      sudo gpasswd -a circleci wheel
      sed -i 's/^.*requiretty/#Defaults requiretty/' /etc/sudoers
    SHELL
  end
end
