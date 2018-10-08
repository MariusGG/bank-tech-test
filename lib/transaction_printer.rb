module TransactionPrinter
  def self.pretty_print(transactions)
    header = 'date || credit || debit || balance\n'
    format_date(transactions)
    format_numbers(transactions)
    return header + format_history(transactions)
  end

  private

  def self.format_date(transactions)
    transactions.each { | transaction |
      transaction.date.gsub!(/([-])/, '/')
    }
  end

  def self.format_history(transactions)
    transactions.each.map { | transaction |
      "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    }.join('\n')
  end
end
