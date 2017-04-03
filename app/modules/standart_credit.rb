module StandartCredit
  class << self
    def calc_repayment(result, month_number)
      (result.summ / result.term)
    end

    def calc_repayment_percent(result, month_number)
      loan_balance = calc_loan_balance(result, month_number - 1)
      ((loan_balance / result.term) * result.interest_rate * 0.01)
    end

    def calc_general_contribution(result, month_number)
      repayment = calc_repayment(result, month_number)
      repayment_percent = calc_repayment_percent(result, month_number)
      repayment + repayment_percent
    end

    def calc_loan_balance(result, month_number)
      repayment = calc_repayment(result, month_number)
      (result.summ - repayment * month_number)
    end
  end
end