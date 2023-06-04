class Api::V1::QuotesController < ApplicationController
  def index
    code, @quotes = Quote.all(permitted_params)
    result = result = {status: code, data: @quotes['docs']}
    render json: result
  end

  def show
    code, @quote = Quote.find_by_id("#{permitted_params[:id]}", true)
    result = result = {status: code, data: @quote['docs']}
    render json: result
  end
end
