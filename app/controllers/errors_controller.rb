class ErrorsController < ApplicationController
  def error404
    render status: :not_found
  end


  def file_not_found
    render status: :not_found
  end
end
