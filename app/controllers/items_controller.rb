class ItemsController < ApplicationController
  before_action :authenticate
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.party_id = params[:party_id]
    if @item.save
      redirect_to party_path(@item.party)
    else
      redirect_to party_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @party = Party.find(params[:party_id])
    @item = @party.items.find(params[:id])
    @item.destroy
    redirect_to party_path(@party)
  end

  def claim_item
    @party = Party.find(params[:party_id])
    @item = Item.find(params[:id])
    @item.img_url = @party.id
    @item.party_id = nil
    @item.user_id = session[:user_id]
    @item.save
    redirect_to party_path(@party)
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
