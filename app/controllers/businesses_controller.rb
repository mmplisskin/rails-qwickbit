class BusinessesController < ApplicationController
  before_action :find_business, only:[:show, :edit, :update, :destroy]
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
      flash[:notice] = 'Business was successfully listed!'
    else
      flash.now[:error] = @business.errors.full_messages
    end
  end

  def edit
  end

  def update
    if @business.update_attributes(business_params)
      flash[:notice] = "Business was successfully updated!"
      return
    end
    render :edit
  end

  def destroy
    @business.destroy
    redirect_to root_path
  end

private
  def find_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :address, :city, :zipcode, :state, :description, :category_id, :phone_number, :user_id)
  end
end
