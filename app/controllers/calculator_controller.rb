class CalculatorController < ApplicationController 

  enable :sessions

  get '/' do
    haml :index
  end

  post '/calc' do
    p params
    session[:calc_result] = CalcResult.new(params[:calc_result]).calc_all_values
    redirect '/result'
  end
  
  get '/result' do
    @calc_result = session[:calc_result]
    if @calc_result.nil?
      redirect '/'
    else
      haml :'calculator/result'
    end
  end

end
