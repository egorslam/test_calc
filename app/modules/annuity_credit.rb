module AnnuityCredit
  class << self
    def calc_repayment(result, month_number)
      general_contribution = calc_general_contribution(result, month_number)
      repayment_percent = calc_repayment_percent(result, month_number)
      general_contribution - repayment_percent
    end

    def calc_repayment_percent(result, month_number)
      result.summ * (result.interest_rate * 0.01) / 12
    end

    def calc_general_contribution(result, month_number)
      p = (result.interest_rate * 0.01) / 12
      result.start_summ * (p + (p / (((1 + p)**result.term) - 1)))
    end

    def calc_loan_balance(result, month_number)
      repayment = calc_repayment(result, month_number)
      result.summ - repayment
    end
  end
end