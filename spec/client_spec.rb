require 'client'

describe Client do

  let(:transaction) { double :transaction }
  let(:transaction_klass) { double :transaction_klass, new: transaction }
  subject { described_class.new(transaction_klass) }

  context '#initialize' do

    it 'initializes with balance equal to 0' do
      expect(subject.balance).to eq 0
    end

  end

  context '#deposit' do

    it { is_expected.to respond_to(:deposit).with(2).arguments }

    it 'creates a new Transaction object' do
      expect(transaction_klass).to receive(:new).with(500, '08-10-2018').and_return(:transaction)
      subject.deposit(500, '08-10-2018')
    end

    it 'adds the deposit amount to the balance' do
      subject.deposit(500, '08-10-2018')
      expect(subject.balance).to eq 500
    end

  end
end
