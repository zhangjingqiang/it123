class SitesController < ApplicationController
  def index
    @sites = Site.where(big_category_id: params[:big_category_id], small_category_id: params[:small_category_id]).order('name').paginate(:page => params[:page])
  end
end
