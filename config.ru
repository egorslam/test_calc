require './config/environment'


use Rack::MethodOverride
use CalculatorController
run ApplicationController

