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
    raise 'Illegal tender!' if illegal_tender?(money)

    @balance += money
    @transactions.push(@transaction_klass.new(credit: money, balance: @balance))
    return @balance
  end

  def withdraw(money)
    raise 'Illegal tender!' if illegal_tender?(money)
    raise 'Insufficient funds' if insufficient_funds?(money)
    
    @balance -= money
    @transactions.push(@transaction_klass.new(debit: money, balance: @balance))
    return @balance
  end

  def account_statement
    print @printer.pretty_print(@transactions)
  end

  private

  def insufficient_funds?(money)
    money > @balance
  end

  def illegal_tender?(money)
    money.round(2) != money
  end

end
