class RemoveLocationFromParties < ActiveRecord::Migration
  def change
    remove_column :parties, :location, :string
  end
end
