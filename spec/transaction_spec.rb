require 'transaction'

describe Transaction do

  context '#initialize' do

    it 'takes two arguments' do
      expect { Transaction.new(500, "08-10-2018") }.not_to raise_error  
    end

  end

end
