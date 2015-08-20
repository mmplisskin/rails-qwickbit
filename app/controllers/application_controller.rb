class ApplicationController < ActionController::Base

  

  force_ssl unless: -> { Rails.env.in? ['development', 'test'] }

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  include SessionsHelper
  include ItemsHelper
  include RatesHelper

end
