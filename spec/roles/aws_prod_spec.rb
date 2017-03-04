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

end
