class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = book
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = book
  end

  def update
    book
    if book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  private
  def book
    @book ||= Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
