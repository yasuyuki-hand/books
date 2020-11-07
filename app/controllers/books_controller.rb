class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def new 
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Successfully saved"
    else
     @books = Book.all
     render action: :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit 
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to @book, notice: "Successfully saved"
  end
  
  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end