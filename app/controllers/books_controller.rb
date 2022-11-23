class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
   @book = Book.new(book_params)
   @book.user.id = current_user.id
   @book.save
  end
  
  def index
    @book = Book.new
  end

  def show
  end

  def edit
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
