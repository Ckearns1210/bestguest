class UsersController < ApplicationController
include ApplicationHelper
before_action :authenticate, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
      flash[:success] = "Welcome to Best Guest!"
    else
      flash.now[:danger] = @user.errors.full_messages.to_sentence
      render "/users/new"
    end
  end

  def edit
    @user= User.find(params[:id])
end

  def update
  @user = User.find(params[:id])

  @user.update(user_params)
  if @user.update_attributes(user_params)
    flash[:success] = "Profile Updated!"
    redirect_to user_path(@user)
  else
    flash[:error] = @user.errors.full_messages.to_sentence
    redirect_to edit_user_path(@user)
  end
end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @items = Item.all
    @parties = Party.all
  end

  def destroy
    @user = User.find(params[:id])
    session[:user_id] = nil
    @user.destroy
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
