class Client

  attr_reader :balance, :transactions

  def initialize(transaction_klass = Transaction,
                  transaction_printer = TransactionPrinter)
    @transaction_klass = transaction_klass
    @transaction_printer = transaction_printer
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    transaction = @transaction_klass.new(date: date,
                                          credit: amount,
                                          balance: @balance)
    @transactions.push(transaction)
  end

  def withdraw(amount, date)
    insufficient_funds?(amount)
    @balance -= amount
    transaction = @transaction_klass.new(date: date,
                                          debit: amount,
                                          balance: @balance)
    @transactions.push(transaction)
  end

  def print_statement
    @transaction_printer.pretty_print(@transactions)
  end

  private

  def insufficient_funds?(amount)
    fail 'Insufficient funds' if amount > @balance
  end

end
