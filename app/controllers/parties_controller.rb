class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def show
    @parties = Party.find(params[:id])
    @items = Item.all
  end


  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
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

  def party_params
    params.require(:playlist).permit(:location, :date, :time, :host)
  end

end
