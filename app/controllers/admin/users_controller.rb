class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:edit, :update, :deactivate, :activate]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    if current_admin
      @item_posts = @user.item_posts
      @facility_posts = @user.facility_posts
      @item_reviews = @user.item_reviews.includes(:item_post)
      @facility_reviews = @user.facility_reviews.includes(:facility_post)
    else
      redirect_to root_path, alert: "他のユーザーの情報にはアクセスできません。"
    end
  end
  
  def edit
    @user = User.find(params[:id])

    if current_admin
    else
      redirect_to root_path, alert: "他のユーザーの情報を編集する権限がありません。"
    end
  end

  def update
    if current_admin
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: 'ユーザー情報が更新されました。'
      else
        render :edit, alert: '更新に失敗しました。'
      end
    else
      redirect_to root_path, alert: "他のユーザーの情報を更新する権限がありません。"
    end
  end
  

  def deactivate
    @user.lock_access!
    redirect_to admin_users_path, notice: 'ユーザーは退会されました。'
  end
  
  def activate
    @user.unlock_access!
    redirect_to admin_users_path, notice: 'ユーザーは有効化されました。'
  end

private

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to admin_users_path, alert: "指定されたユーザーが見つかりません。" if @user.nil?
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end

end
