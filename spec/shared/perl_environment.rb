shared_examples 'perl_environment' do
  describe 'plenv' do
    describe file '/home/a-know/.plenv/.git' do
      it { should be_directory }
      it { should be_owned_by 'a-know' }
      it { should be_grouped_into 'a-know' }
      it { should be_mode 755 }
    end
  end

  describe 'perl-build' do
    describe file '/home/a-know/.plenv/plugins' do
      it { should be_directory }
      it { should be_owned_by 'a-know' }
      it { should be_grouped_into 'a-know' }
      it { should be_mode 755 }
    end

    describe file '/home/a-know/.plenv/plugins/perl-build/.git' do
      it { should be_directory }
      it { should be_owned_by 'a-know' }
      it { should be_grouped_into 'a-know' }
      it { should be_mode 755 }
    end
  end

  describe 'installed perl version' do
    describe file '/home/a-know/.plenv/versions/5.22.1' do
      it { should be_directory }
      it { should be_owned_by 'a-know' }
      it { should be_grouped_into 'a-know' }
      it { should be_mode 755 }
    end
  end
end
