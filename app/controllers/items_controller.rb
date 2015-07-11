class ItemsController < ApplicationController
  before_action :find_item, only:[:show, :edit, :update, :destroy]
  before_action :authorized?, only:[:index, :show, :new, :edit]
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
   @item.business_id = current_business.id
   if @item.save
       flash[:notice] = "#{@item.name} was successfully listed!."
       redirect_to business_path(@item.business.id)
   else
     flash.now[:error] = @item.errors.full_messages
     render :new
   end
 end

 def edit
 end

 def update
   if @item.update_attributes(item_params)
     flash[:notice] = "#{@item.name} was successfully updated!"
     redirect_to business_path(@item.business.id)
   else
     render :edit
   end
 end

 def destroy
     @item.destroy
     redirect_to items_path
 end

private
  def find_item
    @item = Item.find(params[:id])
  end

 def item_params
   params.require(:item).permit(:name, :description, :price, :business_id, :image)
 end

 def authorized?
   current_business != nil
 end
end
