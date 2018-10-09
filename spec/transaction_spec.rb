require 'transaction'

describe Transaction do

  context '#initialize' do

    it 'receives keyword arguments' do
      expect { Transaction.new(balance: 500, money: 500) }.not_to raise_error
    end

    it 'correctly assigns credit and debit amounts' do
      transaction = Transaction.new(balance: 500, money: -200)
      expect(transaction.debit).to eq 200
      expect(transaction.credit).to eq nil
    end

  end

  describe 'attr_readers' do

    before do
      allow(Time).to receive(:now).and_return(Time.mktime(2018, 10, 8))
      @transaction = Transaction.new(money: 500, balance: 500)
    end

    it 'returns the determined date' do
      expect(@transaction.date).to eq '08/10/2018'
    end

    it 'returns the credit provided' do
      expect(@transaction.credit).to eq 500
    end

    it 'returns the debit provided' do
      expect(@transaction.debit).to eq nil
    end

    it 'returns the balance provided' do
      expect(@transaction.balance).to eq 500
    end
  end

end
