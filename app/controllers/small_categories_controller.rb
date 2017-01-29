class SmallCategoriesController < ApplicationController
  def show
    @sites = Site.where(big_category_id: params[:big_category_id], small_category_id: params[:small_category_id]).paginate(:page => params[:page])
  end
end
