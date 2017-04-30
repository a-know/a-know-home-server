require 'spec_helper'

describe 'web' do
  # docker-base
  it_behaves_like 'docker'
  it_behaves_like 'sudoers'
  it_behaves_like 'users'
end
