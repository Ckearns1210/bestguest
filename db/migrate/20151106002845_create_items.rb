class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :img_url
      t.references :user
      t.references :party

      t.timestamps null: false
    end
  end
end
