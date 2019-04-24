class GenresController < ApplicationController
  before_action :authorize, :only => [:create]
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    # Code used before adding Sessions
    #@genre = Genre.new(genre_params)
    #if @genre.save
    #  redirect_to @genre
    #else
    #  render 'new'
    #end

    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path, notice: "You have successfully created a genre"
    else
      redirect_to genres_path, alert: "You will need to be signed in to create an genre"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
