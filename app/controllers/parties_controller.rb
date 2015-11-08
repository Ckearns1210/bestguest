class PartiesController < ApplicationController
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

  # def add_item
  #   party = Party.find(params[:id])
  #   item = Item.find(params[:id])
  #   @item = Item.new
  #   @item.save
  #   item.party_id = party.id
  #   redirect_to party_path(party)
  # end
  #
  # def remove_item
  #   party = Party.find(params[:id])
  #   item = Item.find(params[:id])
  #   party.remove_item(item)
  #   redirect_to party_path(party)
  # end

  private

  def party_params
    params.require(:party).permit(:location, :date, :time, :name)
  end

end
