class BooksController < ApplicationController
  def new
     @book=Book.new
  end
  
  def create
     @book = Book.new(book_params[:id])
    if @book.save
      redirect_to books_path
    # リダイレクト先は
    else
      render:new
    end
  end
  
  def index
  end
  
  def show
  end
end
