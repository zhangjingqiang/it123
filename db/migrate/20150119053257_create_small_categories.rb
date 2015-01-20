class CreateSmallCategories < ActiveRecord::Migration
  def change
    create_table :small_categories do |t|
      t.string :name
      t.integer :big_category_id

      t.timestamps null: false
    end
  end
end
