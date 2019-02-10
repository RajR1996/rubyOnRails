class BooksController < ApplicationController
	def index
		@books=Book.all
	end
	def new
		def create
			#render plain: params[:book].inspect
			@book = Book.new(book_params)
			@book.save
			redirect_to @book
		end
	end
	def show
		@book=Book.find(params[:id])
	end
	private
	def book_params
		params.require(:book).permit(:title, :price, :book_id, :publisher, :description)
	end
end


