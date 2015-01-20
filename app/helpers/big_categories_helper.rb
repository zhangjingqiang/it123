module BigCategoriesHelper
  def big_category_name(id)
    BigCategory.find(id).name rescue nil
  end
end
