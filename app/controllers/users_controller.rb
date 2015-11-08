class UsersController < ApplicationController
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
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render "/users/new"
    end
  end

  def show
    @user = User.find(params[:id])
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
