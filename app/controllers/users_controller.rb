class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]
  before_action :authenticate_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      # 保存に成功した場合
      redirect_to edit_user_path , notice: '登録情報を更新しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def followings
  end

  def followers
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :location, :password,
                                 :password_confirmation)
  end

  def set_user
    if User.find_by_id(params[:id]) == nil
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  def authenticate_user
    unless User.find(params[:id]) == current_user
      if logged_in?
        flash[:fail] = "アクセス出来ません"
        redirect_to edit_user_path(current_user)
      else
        flash[:fail] = "ログインして下さい"
        redirect_to new_session_path
      end
    end
  end

end