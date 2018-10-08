require 'transaction_printer'

describe TransactionPrinter do

  let(:transaction) { double :transaction, date: '10-01-2012', credit: 1000, debit: nil, balance: 1000 }

  it { is_expected.to respond_to(:pretty_print).with(1).argument }

  describe '#pretty_print' do

    context 'given an array of transactions' do
      before do
        @transactions = [transaction]
      end

      it 'pretty prints the transaction history' do
        expect(subject.pretty_print(@transactions)).to eq(
          'date || credit || debit || balance\n'\
          '10/01/2012 || 1000.00 ||  || 1000.00'
        )
      end
    end
  end
end
