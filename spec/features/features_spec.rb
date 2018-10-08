describe 'Bank Test Features' do

  let(:client) { Client.new }

  describe 'Client can deposit money into their account' do

    it 'Adds deposit money to their account balance' do
      client.deposit(500, '08-10-2018')
      expect(client.balance).to eq 500
    end

  end

  context 'Given the balance is greater than the withdrawal amount' do

    describe 'Client can withdraw money from their account' do

      before do
        client.deposit(1000, '08-10-2018')
      end

      it 'Subtracts the withdrawal amount from their balance' do
        client.withdraw(500, '08-10-2018')
        expect(client.balance).to eq 500
      end

    end

  end

  context 'Given the balance is not greater than the withdrawal amount' do

    describe 'Client cannot withdraw money from their account' do

      it 'Raises error message' do
        expect { client.withdraw(500, '08-10-2018') }.to raise_error('Insufficient funds')
      end

    end

  end
end
