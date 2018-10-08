require 'transaction_printer'

describe TransactionPrinter do

  let(:transaction1) { double :transaction, date: '10/01/2012', credit: 1000, debit: nil, balance: 1000 }
  let(:transaction2) { double :transaction, date: '11/01/2012', credit: nil, debit: 500, balance: 500 }

  describe '#pretty_print' do
    before do
      @transactions = [transaction1, transaction2]
    end

    it 'pretty prints the transaction history in reverse chronological order' do
      expect(subject.pretty_print(@transactions)).to eq(
        "date || credit || debit || balance\n"\
        "11/01/2012 ||  || 500.00 || 500.00\n"\
        "10/01/2012 || 1000.00 ||  || 1000.00\n"
      )
    end
  end
end
