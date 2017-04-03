class CalcResultRow

  attr_accessor :month_number
  attr_accessor :repayment
  attr_accessor :repayment_percent
  attr_accessor :general_contribution
  attr_accessor :loan_balance

  def initialize(month_number, repayment, repayment_percent, general_contribution, loan_balance)
    @month_number = month_number
    @repayment = repayment
    @repayment_percent = repayment_percent
    @general_contribution = general_contribution
    @loan_balance = loan_balance
  end

end