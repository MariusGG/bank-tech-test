describe 'Print Transaction History' do

  let(:client) { Client.new }

  describe '#print_statement' do
    before do
      client.deposit(1000, '10-01-2012')
      client.deposit(2000, '13-01-2012')
      client.withdraw(500, '14-01-2012')
    end

    it 'pretty prints the transaction history' do
      expect(client.print_statement).to eq(
        'date || credit || debit || balance\n'\
        '14/01/2012 || || 500.00 || 2500.00\n'\
        '13/01/2012 || 2000.00 || || 3000.00\n'\
        '10/01/2012 || 1000.00 || || 1000.00'
      )
    end
  end
end
