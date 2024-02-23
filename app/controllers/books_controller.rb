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
      redirect_to books_path, notice: "Tu libro fue creado con éxito"
    else
      render :new, status: :unprocessable_entity, alert: "No se pudo crear el libro"
    end
  end

  def edit
    @book = book
  end

  def update
    if book.update(book_params)
      redirect_to book, notice: "Tu libro fue actualizado con éxito"
    else
      render :edit, status: :unprocessable_entity, alert: "No se pudo actualizar el libro"
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
