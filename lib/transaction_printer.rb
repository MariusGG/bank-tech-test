module TransactionPrinter
  def self.pretty_print(transactions)
    'date || credit || debit || balance\n' + format_history(transactions)
  end

  private

  def self.format_history(transactions)
    transactions.reverse.each.map { | transaction |
      "#{format_date(transaction.date)} || "\
      "#{format_number(transaction.credit)} || "\
      "#{format_number(transaction.debit)} || "\
      "#{format_number(transaction.balance)}"
    }.join('\n')
  end

  def self.format_date(date)
    date.gsub!(/([-])/, '/')
  end

  def self.format_number(number)
    return if number == nil
    sprintf("%.2f", number)
  end
end
