class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_user!, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    # @user = User.find(params[:id])
    # @userはbefore_actionでセットされているので、ここでは特に何もしなくて大丈夫です
  end

  def index
    @users = User.all
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "You have updated user successfully."
    else
    # バリデーションエラーがある場合、エラーメッセージを表示して編集画面に戻る
      flash[:error] = "更新に失敗しました"
      render :edit
  end
end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    unless current_user.id == @user.id
      flash[:alert] = "他のユーザーのプロフィールを編集する権限がありません。"
      redirect_to user_path(current_user)
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
