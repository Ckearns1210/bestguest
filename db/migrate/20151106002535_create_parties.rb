class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :location
      t.date :date
      t.time :time
      t.integer :host

      t.timestamps null: false
    end
  end
end
