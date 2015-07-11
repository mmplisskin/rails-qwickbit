class BusinessesController < ApplicationController
  before_action :find_business, only:[:show, :edit, :update, :destroy]
  before_action :authorized?, only:[:index, :show, :new, :edit]
  def index
    @businesses = Business.all
    respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @businesses
        }
    end
  end

  def show
    respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @business
        }
    end
  end


  def new
    @business=Business.new
  end

  def create
    @business=Business.new(business_params)
    if @business.save
      session[:business_id] = @business.id.to_s
      flash[:notice] = 'Business was successfully listed!'
      redirect_to business_path(@business.id)
    else
      flash.now[:error] = @business.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @business.update_attributes(business_params)
      flash[:notice] = "Business was successfully updated!"
      redirect_to business_path(@business.id)
    else
      render :edit
    end
  end

  def destroy
    @business.destroy
    redirect_to businesses_path
  end

  def search

    @businesses = Business.search(params)
    respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @businesses
        }
    end
  end


private
  def find_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :email, :address, :city, :zipcode, :state, :description, :category_id, :phone_number, :business_id, :password, :password_confirmation)
  end

  def authorized?
    current_business != nil
  end
end
