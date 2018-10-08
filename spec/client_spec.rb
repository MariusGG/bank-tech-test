require 'client'

describe Client do

  let(:transaction) { double :transaction }
  let(:transactionKlass) { double :transactionKlass, new: transaction }
  subject { described_class.new(transactionKlass) }

  context '#initialize' do

    it 'initializes with balance equal to 0' do
      expect(subject.balance).to eq 0
    end

  end

  context '#deposit' do

    it { is_expected.to respond_to(:deposit).with(2).arguments }

    it 'creates a new Transaction object' do
      expect(transactionKlass).to receive(:new).with(500, "08-10-2018").and_return(:transaction)
      subject.deposit(500, "08-10-2018")
    end

  end
end
