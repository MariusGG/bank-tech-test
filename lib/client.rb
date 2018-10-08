class Client

  attr_reader :balance

  def initialize(transactionKlass = Transaction)
    @transactionKlass = transactionKlass
    @balance = 0
  end

  def deposit(amount, date)
    transaction = @transactionKlass.new(amount, date)
  end

end
