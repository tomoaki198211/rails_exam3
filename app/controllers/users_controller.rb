class UsersController < ApplicationController

  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    set_user
  end

  def edit
    set_user
    if logged_in? && @user.id == current_user.id
      render :edit
    else
      redirect_to user_path(current_user),  notice:"編集出来ません。作成者のみ編集可能です"
    end
  end

  def update
    set_user
      if @user.update(user_params)
        redirect_to user_path(@user.id), notice:"編集しました"
      else
        render :edit
      end
  end

  def favorites
    @user = User.find(current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name,
                          :myimage, :myimage_cache,
                          :password, :password_confirmation)
  end

end
