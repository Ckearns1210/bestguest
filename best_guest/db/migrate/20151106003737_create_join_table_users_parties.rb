class CreateJoinTableUsersParties < ActiveRecord::Migration
  def change
    create_join_table :users, :parties do |t|
    end
  end
end
