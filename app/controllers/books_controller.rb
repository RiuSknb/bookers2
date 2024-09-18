class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    # binding.irb
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save

    redirect_to user_path(current_user)
  end

  def index
  end

  def show
  end




    # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end



end
