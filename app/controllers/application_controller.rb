require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    register Sinatra::Partial
    set :session_secret, "My session secret"
  end

end