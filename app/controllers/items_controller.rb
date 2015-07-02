class ItemsController < ApplicationController
  before_action :find_items, only:[:show, :edit, :update, :destroy]
def index
   @items=Item.all
   respond_to do |format|
       format.html {
           render
       }
       format.json {
           render json: @items
       }
   end
 end

 def show
     respond_to do |format|
         format.html {
             render
         }
         format.json {
             render json: @item
         }
    end
 end

 def new
   @item=Item.new
 end

 def create
   @item=Item.new(item_params)
   if @item.save
       flash[:notice] = 'Item was successfully listed!.'
       redirect_to root_path
   else
     flash.now[:error] = @item.errors.full_messages
     render :new
   end
 end

 def edit
 end

 def update
   if @item.update_attributes(item_params)
     flash[:notice] = "Business was successfully updated!"
     return
   end
   render :edit
 end

 def destroy
     @item.destroy
     redirect_to root_path
 end

private
  def find_items
    @items = Item.find(params[:id])
  end

 def item_params
   params.require(:item).permit(:name, :description, :price, :business_id)

 end

end
end
