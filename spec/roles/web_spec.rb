require 'spec_helper'

describe 'web' do
  it_behaves_like 'firewalld::disable'
  it_behaves_like 'ruby'
  it_behaves_like 'sudoers'
  it_behaves_like 'timezone'
end