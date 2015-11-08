class ItemsController < ApplicationController

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
    @item = Item.find(params[:id])
    @item.destory
    redirect_to items_path
  end

  def claim_item
    @item = Item.find(params[:id])
    @item.party_id = nil
    @item.user_id = session[:user_id]
  end

  private

  def item_params
    params.require(:item).permit(:name, :img_url)
  end
end
