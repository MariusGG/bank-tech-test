class Client

  attr_reader :balance, :transactions

  def initialize(transaction_klass = Transaction, transaction_printer = TransactionPrinter)
    @transaction_klass = transaction_klass
    @transaction_printer = transaction_printer
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

  def print_statement
    @transaction_printer.pretty_print(@transactions)
  end

  private

  def insufficient_funds?(amount)
    fail 'Insufficient funds' if amount > @balance
  end

end
