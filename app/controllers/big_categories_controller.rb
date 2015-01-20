class BigCategoriesController < ApplicationController
  def show
    @big_categories = BigCategory.all.order('name')
    @small_categories = SmallCategory.where(big_category_id: params[:id])
  end
end
