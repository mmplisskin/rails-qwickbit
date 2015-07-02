class BusinessController < ApplicationController

  def index

    @business=Business.all

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

    @business=Business.find(params[:id])

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

    @business=Business.new(business_params)

    # respond_to do |format|
    #     format.html {
    #         render
    #     }
    #     format.json {
    #         render json: @business
    #     }
    # end
  end


  def create

    @business=Business.new(business_params)

    if @business.save
      flash[:notice] = 'Business was successfully listed!.'

    else
      flash.now[:error] = @business.errors.full_messages
    end
  end

  def destroy

    @business=Business.find(parms[:id])
    @item.destroy
    redirect_to root_path
  end

  private
    def business_params
      params.require(:businesses).permit(:name, :adress, :city, :zipcode, :state, :description, :category_id, :phone_number, :user_id)

    end



end
