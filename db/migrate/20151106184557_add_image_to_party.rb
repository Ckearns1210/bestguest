class AddImageToParty < ActiveRecord::Migration
  def change
    add_column :parties, :img_url, :string
  end
end
