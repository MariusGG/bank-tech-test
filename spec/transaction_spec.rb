require 'transaction'

describe Transaction do

  context '#initialize' do

    it 'takes two arguments' do
      expect { Transaction.new(date: '08-10-2018', balance: 500) }.not_to raise_error
    end

  end

  describe 'attr_readers' do

    subject { described_class.new(date: '08-10-2018', credit: 500, balance: 500) }

    it 'returns the date provided' do
      expect(subject.date).to eq '08-10-2018'
    end

    it 'returns the credit provided' do
      expect(subject.credit).to eq 500
    end

    it 'returns the debit provided' do
      expect(subject.debit).to eq nil
    end

    it 'returns the current balance' do
      expect(subject.balance).to eq 500
    end
  end

end
