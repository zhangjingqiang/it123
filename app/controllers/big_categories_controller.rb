class BigCategoriesController < ApplicationController
  def show
    @big_categories = BigCategory.all
    @small_categories = SmallCategory.where(big_category_id: params[:big_category_id]).paginate(:page => params[:page])
  end
end
