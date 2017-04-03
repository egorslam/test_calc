class CalcResult

  include StandartCredit
  include AnnuityCredit

  attr_accessor :interest_rate
  attr_accessor :summ
  attr_accessor :start_summ
  attr_accessor :method_of_loan_repayment
  attr_accessor :term
  attr_accessor :rows

  attr_accessor :total_repayment
  attr_accessor :total_repayment_percent
  attr_accessor :total_general_contribution


  def initialize(attributes)
    @interest_rate = attributes['interest_rate'].to_f
    @start_summ = attributes['summ'].to_f
    @summ = attributes['summ'].to_f
    @method_of_loan_repayment = attributes['method_of_loan_repayment']
    @term = attributes['term'].to_i
    @rows = []
  end

  def calc_all_values
    1.upto(@term) do | month_number |
      row = initialize_calc_result_row(self, month_number)
      @rows << row
    end
    self
  end

  def initialize_calc_result_row(result, month_number)
    repayment = module_by_method_of_loan_repayment::calc_repayment(result, month_number)
    repayment_percent = module_by_method_of_loan_repayment::calc_repayment_percent(result, month_number)
    general_contribution = module_by_method_of_loan_repayment::calc_general_contribution(result, month_number)
    loan_balance = module_by_method_of_loan_repayment::calc_loan_balance(result, month_number)

    result.summ = result.summ - repayment if @method_of_loan_repayment == 'annuity'

    result.total_repayment = total_repayment.to_i + repayment
    result.total_repayment_percent = total_repayment_percent.to_i + repayment_percent
    result.total_general_contribution = total_general_contribution.to_i + general_contribution
    
    CalcResultRow.new(month_number, repayment, repayment_percent, general_contribution, loan_balance)
  end


  def module_by_method_of_loan_repayment
    Object.const_get(@method_of_loan_repayment.capitalize + 'Credit')
  end
end
