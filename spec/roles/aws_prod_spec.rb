require 'spec_helper'

describe 'web' do
  # aws-base
  it_behaves_like 'sudoers'
  it_behaves_like 'users'
  # aws-middleware
  it_behaves_like 'chrony'

end
