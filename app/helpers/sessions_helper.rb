module SessionsHelper
  def current_business
    @current_business ||= Business.find_by(id: session[:business_id])
  end
end
