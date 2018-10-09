class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(money:, balance:)
    @date = determine_date
    @balance = balance
    assign_credit_and_debit(money)
  end

  private

  def determine_date
    Time.now
  end

  def assign_credit_and_debit(money)
    money.negative? ? @debit = money.abs : @credit = money
  end

end
