class Client

  attr_reader :balance

  def initialize(transaction_klass = Transaction)
    @transaction_klass = transaction_klass
    @balance = 0
  end

  def deposit(amount, date)
    transaction = @transaction_klass.new(amount, date)
    @balance += amount
  end

end
