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
end
