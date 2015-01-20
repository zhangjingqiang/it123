class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.integer :small_category_id

      t.timestamps null: false
    end
  end
end
