class AddBigCategoryIdToSites < ActiveRecord::Migration
  def change
    add_column :sites, :big_category_id, :integer
  end
end
