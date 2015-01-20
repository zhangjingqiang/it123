class CreateBigCategories < ActiveRecord::Migration
  def change
    create_table :big_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
