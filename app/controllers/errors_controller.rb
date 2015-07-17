class ErrorsController < ApplicationController
  def error404
    # render status: :not_found
    render 'layouts/error404'
  end


  def file_not_found
    render 'layouts/error404'
  end
end
