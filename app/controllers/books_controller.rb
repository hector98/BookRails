class BooksController < ApplicationController
  def index
    @books = Book.all.with_attached_image
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
      redirect_to books_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity, alert: t('.failed')
    end
  end

  def edit
    @book = book
  end

  def update
    if book.update(book_params)
      redirect_to book, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity, alert: t('.failed')
    end
  end

  def destroy
    if book.destroy
      redirect_to books_path, notice: t('.destroyed')
    else
      redirect_to book, status: :unprocessable_entity, alert: t('.failed')
    end
  end

  private
  def book
    @book ||= Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :opinion, :image)
  end
end
