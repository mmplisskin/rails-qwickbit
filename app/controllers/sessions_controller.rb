class SessionsController < ApplicationController
  def new
  end

  def create
    business = Business.find_by(email: params[:login][:email])
    if business && business.authenticate(params[:login][:password])
      # make a new key in our session object called :user_id
      # which gets stored in a cookie in our browser
      session[:business_id] = business.id.to_s
      redirect_to businesses_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:business_id)
    redirect_to businesses_path
  end
end
