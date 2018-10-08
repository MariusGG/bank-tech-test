require 'client'

describe Client do

  let(:transaction_klass) { double :transaction_klass, new: "" }
  let(:transaction_printer) { double :transaction_printer }
  subject { described_class.new(transaction_klass, transaction_printer) }

  describe '#initialize' do
    it 'initializes with balance equal to 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do

    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'creates a new Transaction object' do
      expect(transaction_klass).to receive(:new).with(credit: 500, balance: 500)
      subject.deposit(500)
    end

    it 'adds the Transaction object into the transactions array' do
      expect { subject.deposit(500) }.to change { subject.transactions.length }.by(1)
    end

    it 'adds the deposit amount to the balance' do
      expect { subject.deposit(500) }.to change { subject.balance }.by(500)
    end
  end

  describe '#withdraw' do
    context 'Given sufficient funds' do
      before do
        subject.deposit(1000)
      end

      it 'creates a new Transaction object' do
        expect(transaction_klass).to receive(:new).with(debit: 500, balance: 500)
        subject.withdraw(500)
      end

      it 'adds the Transaction object into the transactions array' do
        expect { subject.withdraw(500) }.to change { subject.transactions.length }.by(1)
      end

      it 'subtracts the withdrawal amount from the balance' do
        expect { subject.withdraw(500) }.to change { subject.balance }.by(-500)
      end
    end

    context 'Given insufficient funds' do
      it 'raises error if withdrawal amount is greater than the balance' do
        expect { subject.withdraw(500) }.to raise_error('Insufficient funds')
      end
    end
  end

  describe '#print_statement' do
    it 'invokes #pretty_print on PrettyPrinter module' do
      expect(transaction_printer).to receive(:pretty_print).with(subject.transactions)
      subject.print_statement
    end
  end

end
