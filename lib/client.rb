class Client

  attr_reader :balance, :transactions

  def initialize(transaction_klass = Transaction)
    @transaction_klass = transaction_klass
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    transaction = @transaction_klass.new(amount, date)
    @transactions.push(transaction)
    @balance += amount
  end

  def withdraw(amount, date)
    insufficient_funds?(amount)
    transaction = @transaction_klass.new(amount, date)
    @transactions.push(transaction)
    @balance -= amount
  end

  private

  def insufficient_funds?(amount)
    fail 'Insufficient funds' if amount > @balance
  end

end
