shared_examples 'growthforecast' do
  describe file '/home/a-know/growthforecast' do
    it { should be_directory }
    it { should be_owned_by 'a-know' }
    it { should be_grouped_into 'a-know' }
    it { should be_mode 755 }
  end

  describe file '/home/a-know/growthforecast/cpanfile' do
    it { should be_file }
    it { should be_owned_by 'a-know' }
    it { should be_grouped_into 'a-know' }
    it { should be_mode 644 }
  end

  describe 'rrdtool dependencies' do
    describe package 'pkgconfig' do
      it { should be_installed }
    end
    describe package 'glib2-devel' do
      it { should be_installed }
    end
    describe package 'gettext' do
      it { should be_installed }
    end
    describe package 'libxml2-devel' do
      it { should be_installed }
    end
    describe package 'pango-devel' do
      it { should be_installed }
    end
    describe package 'cairo-devel' do
      it { should be_installed }
    end
  end

  describe file '/home/a-know/growthforecast/local/bin/growthforecast.pl' do
    it { should be_file }
    it { should be_owned_by 'a-know' }
    it { should be_grouped_into 'a-know' }
    it { should be_mode 555 }
  end
end
