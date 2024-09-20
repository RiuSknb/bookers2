class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @user = current_user
    @books = @user.books
    @book = Book.find(params[:id])
  end

  def show
    @user = current_user
    @books = @user.books
    @book = Book.find(params[:id])
  end




    # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end



end
