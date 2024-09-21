class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to @book, notice: 'You have created book successfully.'
    else
      @user = current_user
      @books = Book.all # 本のリストを取得
      @users = User.all  # ユーザーのリストを取得
      render :index # index ビューを再表示
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])  # Bookを先に取得
    @user = @book.user              # Bookに関連するUserを取得
    @books = @user.books            # そのUserが所有している本の一覧を取得
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end


    # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end



end
