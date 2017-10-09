shared_examples 'perl-json' do
    describe package 'perl-JSON' do
      it { should be_installed }
    end
  end
  