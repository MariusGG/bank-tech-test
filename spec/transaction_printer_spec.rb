require 'transaction_printer'

describe TransactionPrinter do

  it { is_expected.to respond_to(:pretty_print) }

end
