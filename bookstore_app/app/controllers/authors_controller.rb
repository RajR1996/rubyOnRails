class AuthorsController < ApplicationController
  before_action :authorize, :only => [:create]
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    # Code used before adding Sessions
    #@author = Author.new(author_params)
    #if @author.save
    #  redirect_to authors_path
    #else
    #  render 'new'
    #end

    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path, notice: "You have successfully created an author"
    else
      redirect_to authors_path, alert: "You will need to be signed in to create an author"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def author_params
    params.require(:author).permit(:fname, :lname, :bio)
  end
end
