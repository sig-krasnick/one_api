class QuotesController < ApplicationController
  def index
    code, @quotes = Quote.all(permitted_params)
    result = result = {status: code, data: @quotes['docs']}
    render json: result
  end

  def show
    code, @quotes = Quote.find_by_id("#{permitted_params[:id]}", true)
    result = result = {status: code, data: @quotes['docs']}
    render json: result
  end

  private

  def permitted_params
    params.permit(:id, :query)
  end
end
