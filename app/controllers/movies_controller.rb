class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render json: @movie.errors, status: 422
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render json: @movie.errors, status: 422
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :cowscription)
  end
end
