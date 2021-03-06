shared_examples 'ruby' do
  describe package 'ruby' do
    it { should be_installed.with_version '2.4.0' }
  end

  describe package 'bundler' do
    it { should be_installed.by 'gem' }
  end
end
