require "spec_helper"

RSpec.describe CalculatorController do

  def app
    CalculatorController
  end

  describe "Check main page" do
    context "main page" do
      it "returns form" do
        get "/"
        expect(last_response.status).to eq 200
      end
    end
  end

  describe "POST cacl" do
    it "returns status 302" do
      post "/calc", {"calc_result": {"interest_rate": "10", "summ": "10000", "method_of_loan_repayment": "annuity", "term": "6"}}
      expect(last_response.status).to eq(302)
    end
  end
end