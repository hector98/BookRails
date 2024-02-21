class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = book
  end

  private
  def book
    @book ||= Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
