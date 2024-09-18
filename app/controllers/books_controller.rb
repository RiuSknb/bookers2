class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    # binding.irb
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save

    redirect_to books_path(book_id: @book.id)
  end

  def index
    @user = current_user
    @books = @user.books
    @book = Book.find(params[:book_id])
  end

  def show
  end




    # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end



end
