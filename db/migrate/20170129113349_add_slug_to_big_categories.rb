class AddSlugToBigCategories < ActiveRecord::Migration
  def change
    add_column :big_categories, :slug, :string
    add_index :big_categories, :slug, unique: true
  end
end
