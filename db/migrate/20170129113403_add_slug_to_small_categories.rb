class AddSlugToSmallCategories < ActiveRecord::Migration
  def change
    add_column :small_categories, :slug, :string
    add_index :small_categories, :slug, unique: true
  end
end
