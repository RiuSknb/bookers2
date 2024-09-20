class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   redirect_to user_path(current_user.id)
  # end
  def update
    @user = User.find(params[:id])
    puts "introductionの値: #{params[:user][:introduction]}"
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
    # バリデーションエラーがある場合、エラーメッセージを表示して編集画面に戻る
      flash[:error] = "更新に失敗しました"
      render :edit
  end
end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
