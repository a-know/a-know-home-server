require 'spec_helper'

describe 'web' do
  it_behaves_like 'chrony'
  it_behaves_like 'firewalld::disable'
  it_behaves_like 'git'
  it_behaves_like 'hostname'
  it_behaves_like 'openssh'
  it_behaves_like 'ruby'
  it_behaves_like 'selinux'
  it_behaves_like 'sudoers'
  it_behaves_like 'td-agent'
  it_behaves_like 'timezone'
end