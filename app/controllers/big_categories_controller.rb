class BigCategoriesController < ApplicationController
  def show
    @big_categories = BigCategory.all
    @small_categories = SmallCategory.where(big_category_id: params[:id]).paginate(:page => params[:page])
  end
end
