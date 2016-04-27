class SettingsController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :location, :password,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end