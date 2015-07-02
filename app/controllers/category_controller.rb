class CategoryController < ApplicationController

  def index
    @category = Category.all
  end

end
