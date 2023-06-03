class Api::V1::MoviesController < ApplicationController
  def index
    code, @movies = Movie.all(permitted_params)
    result = {status: code, data: @movies['docs']}
    render json: result
  end

  def show
    code, @movie = Movie.find_by_id("#{permitted_params[:id]}")
    result = {status: code, data: @movie['docs']}
    render json: result
  end

  def quote
    code, @movies = Movie.find_by_id("#{permitted_params[:id]}", true)
    result = {status: code, data: @movies['docs']}
    render json: result
  end

  private

  def permitted_params
    params.permit(:id, :query)
      
      # :name, :runtimeInMinutes, :budgetInMillions, :boxOfficeRevenueInMillions, :academyAwardNominations,
      #             :academyAwardWins, :rottenTomatoesScore )
  end

  
end