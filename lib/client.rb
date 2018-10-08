require_relative './transaction'
require_relative './transaction_printer'

class Client

  attr_reader :balance, :transactions

  def initialize(transaction_klass = Transaction, printer = TransactionPrinter)
    @transaction_klass = transaction_klass
    @printer = printer
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions.push(@transaction_klass.new(credit: amount, balance: @balance))
  end

  def withdraw(amount)
    insufficient_funds?(amount)
    @balance -= amount
    @transactions.push(@transaction_klass.new(debit: amount, balance: @balance))
  end

  def print_statement
    print @printer.pretty_print(@transactions)
  end

  private

  def insufficient_funds?(amount)
    fail 'Insufficient funds' if amount > @balance
  end

end
