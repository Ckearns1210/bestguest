class AddAddressToParties < ActiveRecord::Migration
  def change
    add_column :parties, :address, :string
  end
end
