class ApplicationController < ActionController::API

  protected
  
  def permitted_params
    params.permit(:id, :query, :sort, :page, :offset, :limit)
  end
end
