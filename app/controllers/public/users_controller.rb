class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:mypage, :edit, :update, :deactivate]
  
  def mypage
    @user = current_user
    @item_posts = @user.item_posts
    @facility_posts = @user.facility_posts
    @item_reviews = @user.item_reviews.includes(:item_post)
    @facility_reviews = @user.facility_reviews.includes(:facility_post)
  end

  def index
    @users = User.where(admin: false)
  end

  def show
  end

  def create
  end

  def edit
    @user.update(user_params)
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_public_users_path, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end

  def deactivate
    @user.lock_access!
    sign_out current_user
    redirect_to root_path, notice: '退会処理が完了しました。'
  end


  
  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
