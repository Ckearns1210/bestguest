class PartiesController < ApplicationController
  include ApplicationHelper
  before_action :authenticate
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find(params[:id])
    @item  = Item.new
    @item.party_id = @party.id
    @users = User.all
    @user = session[:user_id]
    @items = Item.all
  end


  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    @party.host = session[:user_id]
    if @party.save

      user = User.find(session[:user_id])
      user.parties << @party
      redirect_to party_path(@party)
      flash[:success] = "Event Succesfully Created!"
    else
      redirect_to new_party_path
    end

end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    @party.update(party_params)
    redirect_to party_path(@party)
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destory
    redirect_to parties_path
  end

  def add_user
    party = Party.find(params[:id])
    user= User.find(params[:user_id])
    if user.parties.include?(party)
      flash[:error] = "#{user.name} has already been invited!"
      redirect_to party_path(party)
    else
    user.parties << party
    flash[:alert] = " #{user.name} has been added to your party!"
    redirect_to party_path(party)
  end
  end

  def remove_user
    @party = Party.find(params[:party])
    @user = user.find(params[:user])
    if user.parties.include?(party)
      user.parties.delete(party)
      flash[:alert] = "# {user.name} has been removed from your event."
    render party_path(party)
  end
end


  private

  def party_params
    params.require(:party).permit(:address, :date, :time, :name)
  end

end
