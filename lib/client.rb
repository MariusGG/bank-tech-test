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

  def deposit(money)
    @balance += money
    @transactions.push(@transaction_klass.new(credit: money, balance: @balance))
  end

  def withdraw(money)
    insufficient_funds?(money)
    @balance -= money
    @transactions.push(@transaction_klass.new(debit: money, balance: @balance))
  end

  def account_statement
    print @printer.pretty_print(@transactions)
  end

  private

  def insufficient_funds?(money)
    fail 'Insufficient funds' if money > @balance
  end

end
