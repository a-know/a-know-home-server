shared_examples 'timezone' do
  describe file '/etc/localtime' do
    it { should be_linked_to '/usr/share/zoneinfo/Asia/Tokyo' }
  end

  describe command 'date' do
    its(:stdout) { should include ' JST' }
  end
end