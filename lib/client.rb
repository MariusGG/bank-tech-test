require_relative './transaction'
require_relative './transaction_printer'

class Client

  attr_reader :balance, :transactions

  def initialize(transaction_klass = Transaction,
                  transaction_printer = TransactionPrinter)
    @transaction_klass = transaction_klass
    @transaction_printer = transaction_printer
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transaction = @transaction_klass.new(date: determine_date,
                                          credit: amount,
                                          balance: @balance)
    @transactions.push(transaction)
  end

  def withdraw(amount)
    insufficient_funds?(amount)
    @balance -= amount
    transaction = @transaction_klass.new(date: determine_date,
                                          debit: amount,
                                          balance: @balance)
    @transactions.push(transaction)
  end

  def print_statement
    print @transaction_printer.pretty_print(@transactions)
  end

  private

  def insufficient_funds?(amount)
    fail 'Insufficient funds' if amount > @balance
  end

  def determine_date
    Time.now.strftime("%d/%m/%Y")
  end

end
