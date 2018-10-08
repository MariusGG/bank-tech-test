describe 'Feature: Withdraw' do

  let(:client) { Client.new }

  context 'Given the balance is greater than the withdrawal amount' do
    before do
      client.deposit(1000)
    end

    it 'subtracts the withdrawal amount from the balance' do
      client.withdraw(500)
      expect(client.balance).to eq 500
    end
  end

  context 'Given the balance is not greater than the withdrawal amount' do
    it 'raises error message: Insufficient funds' do
      expect { client.withdraw(500) }.to raise_error('Insufficient funds')
    end
  end
end
