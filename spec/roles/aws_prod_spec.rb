require 'spec_helper'

describe 'web' do
  # aws-base
  it_behaves_like 'sudoers'
  it_behaves_like 'users'
  # aws-middleware
  it_behaves_like 'chrony'
  it_behaves_like 'firewalld::disable'
  it_behaves_like 'gcc'
  it_behaves_like 'git'
  it_behaves_like 'hostname'
  it_behaves_like 'imagemagick'
  it_behaves_like 'logrotate'
  it_behaves_like 'mkr'
  it_behaves_like 'net-tools'
  it_behaves_like 'openssh'
  it_behaves_like 'openssl'
  it_behaves_like 'openssl-devel'
  it_behaves_like 'patch'
  it_behaves_like 'ruby'
  it_behaves_like 'selinux'
  it_behaves_like 'sysstat'
  it_behaves_like 'timezone'
  it_behaves_like 'zlib'
  # aws-application
  it_behaves_like 'bigquery::settings'
  it_behaves_like 'nginx::aws'
  it_behaves_like 'td-agent'
  # aws-prod
  it_behaves_like 'crond'
  it_behaves_like 'crontab'
  it_behaves_like 'mackerel'
  it_behaves_like 'mkswap'
end
