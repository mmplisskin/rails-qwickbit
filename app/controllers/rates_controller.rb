class RatesController < ApplicationController
  def index
    @rates=Rate.all
    respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @rates
        }
    end
  end
end
