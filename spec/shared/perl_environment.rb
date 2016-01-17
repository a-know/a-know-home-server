shared_examples 'perl_environment' do
  describe 'plenv' do
    describe file '/usr/local/perlenv/.plenv/.git' do
      it { should be_directory }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_mode 755 }
    end
  end
end
