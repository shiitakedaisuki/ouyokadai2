class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @postbook = Book.new
  end

  def index
    @postbook = Book.new
    @books = Book.all
  end

  def create
    @postbook = Book.new(book_params)
    @postbook.user_id = current_user.id
    if @postbook.save
      redirect_to book_path(@postbook.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @postbook = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
