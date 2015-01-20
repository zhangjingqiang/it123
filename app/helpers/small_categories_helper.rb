module SmallCategoriesHelper
  def small_category_name(id)
    SmallCategory.find(id).name rescue nil
  end
end
