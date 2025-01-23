require "net/http"

class MoviesController < ApplicationController
  BASE_URL = "https://api.themoviedb.org/3"
  API_KEY = "b96189e4afb31a13c4500802fa18ec42"

  def index
    query = params[:query]
    page = params[:page] || 1

    if query.present?
      url = "#{BASE_URL}/search/movie?api_key=#{API_KEY}&query=#{query}"
      response = Net::HTTP.get(URI(url))
      @movies = JSON.parse(response)["results"]
      @total_pages = [JSON.parse(response)["total_pages"], 10].min
      render partial: "movies_list"  # Turbo takes care of updating the view
    else
      url = "#{BASE_URL}/movie/popular?api_key=#{API_KEY}&language=en-US&page=1"
      response = Net::HTTP.get(URI(url))
      @movies = JSON.parse(response)["results"]
      @total_pages = [JSON.parse(response)["total_pages"], 10].min
    end

    @current_page = page.to_i
  end

  def show
    movie_id = params[:id]
    url = "#{BASE_URL}/movie/#{movie_id}?api_key=#{API_KEY}&language=en-US"
    response = Net::HTTP.get(URI(url))
    @movie = JSON.parse(response)
  end
end
