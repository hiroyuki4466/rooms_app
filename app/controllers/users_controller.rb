class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def account
    @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:user_image, :name, :user_introduction))
      flash[:notice] = "プロフィールを更新しました"
      redirect_to :tops
    else
      flash.now[:errors] = "更新に失敗しました。もう一度入力し直してください"
      render "users/:id/edit"
    end
  end
end
