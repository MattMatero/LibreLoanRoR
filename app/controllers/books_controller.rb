class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    respond_to do |format|
      if @book.save
        format.html {redirect_to root_path, notice: 'Book successfully added'}
        format.json {render :show, status: :created, location: @book}
      else
        format.html {render :new}
        format.json {render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:name,:booktype,:desc)
  end
end
