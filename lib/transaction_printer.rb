module TransactionPrinter

  def self.pretty_print(transactions)
    "date || credit || debit || balance\n#{format_history(transactions)}\n"
  end

  def self.format_history(transactions)
    transactions.reverse_each.map { |transaction|
      "#{transaction.date} || "\
      "#{format_number(transaction.credit)} || "\
      "#{format_number(transaction.debit)} || "\
      "#{format_number(transaction.balance)}"
    }.join("\n")
  end

  def self.format_number(number)
    return if number.nil?

    sprintf("%.2f", number)
  end

  private_class_method :format_history, :format_number

end
