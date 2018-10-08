describe 'Withdraw' do

  let(:client) { Client.new }

  context 'Given the balance is greater than the withdrawal amount' do
    describe 'Client can withdraw money from their account' do
      before do
        client.deposit(1000)
      end

      it 'Subtracts the withdrawal amount from their balance' do
        client.withdraw(500)
        expect(client.balance).to eq 500
      end
    end
  end

  context 'Given the balance is not greater than the withdrawal amount' do
    describe 'Client cannot withdraw money from their account' do
      it 'Raises error message: Insufficient funds' do
        expect { client.withdraw(500) }.to raise_error('Insufficient funds')
      end
    end
  end

end
