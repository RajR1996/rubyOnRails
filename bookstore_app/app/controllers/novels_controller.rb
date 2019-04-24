class NovelsController < ApplicationController
  before_action :authorize, :only => [:create]
  def index
    @novels = Novel.all
    @genres = Genre.all
  end

  def show
    @novel = Novel.find(params[:id])
    @genres = Genre.all
  end

  def new
    @novel = Novel.new
    @genre = Genre.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    # Code used before adding Sessions
    # @novel = Novel.new(novel_params)
    # @novel.save
    # flash[:notice] = 'Novel Added'
    # redirect_to novels_path

    @novel = Novel.new(novel_params)
      if @novel.save
        redirect_to novels_path, notice: "You have successfully created a novel"
      else
        redirect_to novels_path, alert: "You will need to be signed in to create a novel"
      end
  end

  def update
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      flash[:notice] = 'Novel Details Updated'
      redirect_to @novel
    else
      render 'edit'
      #redirect_to novels_path
    end
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to novels_path
  end

  def search
    @novels =
    if params[:term]
      Novel.where('title LIKE ? or format LIKE ?', "%#{params[:term]}", "%#{params[:term]}")
    else 
      Novel.all
    end
  end

  private
    def novel_params
      params.require(:novel).permit(:title, :genre_id, :author_id, :publisher_id, :isbn, :price, :publication, :format, :description, :pages)
    end
end
