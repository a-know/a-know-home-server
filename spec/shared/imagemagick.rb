shared_examples 'imagemagick' do
  describe package 'ImageMagick' do
    it { should be_installed }
  end
end
