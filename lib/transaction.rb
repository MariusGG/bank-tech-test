class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(credit: nil, debit: nil, balance:)
    @date = determine_date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  private

  def determine_date
    Time.now.strftime("%d/%m/%Y")
  end

end
