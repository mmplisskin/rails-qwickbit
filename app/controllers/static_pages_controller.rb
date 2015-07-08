class StaticPagesController < ApplicationController
  def landing
    @business = Business.new
  end

  def contact
  end
end
