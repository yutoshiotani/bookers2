class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
   redirect_to book_path(@book.id)
   flash[:notice] =  'You have created book successfully.'
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = 'You have updated book successfully.'
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  def index
    @books =Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
