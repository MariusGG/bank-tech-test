describe 'Bank Test Features' do

  let(:client) { Client.new }
  
  context 'Client can deposit money into their account' do
    it 'Adds deposit money to their account balance' do
      client.deposit(500, "08-10-2018")
      expect(client.balance).to eq 500
    end
  end
end
