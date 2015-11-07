class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find(params[:id])
    @items = Item.all
    @users = User.all
  end


  def new
    @party = Party.new
    @items= Item.new
    @users = User.new
  end

  def create
    @party = Party.new(party_params)
    @party.host = current_user.id
    if @party.save
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
    redirect_to party(@party)
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destory
    redirect_to parties_path
  end

  def add_user
    party = Party.find(params[:id])
    user= User.find(params[:user_id])
    user.parties << party
    flash[:alert] = " #{user.name} has been added to your party!"
    redirect_to party_path(party)
  end

  def add_item
    party = Party.find(params[:id])
    item = Item.find(params[:item_id])
    party.add_item(item)
    refirect_to party_path(party)
  end

  def remove_item
    party = Party.find(params[:id])
    item = Item.find(params[:item_id])
    party.remove_item(item)
    redirect_to party_path(party)
  end

  private

  def party_params
    params.require(:party).permit(:location, :date, :time, :name, :img_url)
  end

end
