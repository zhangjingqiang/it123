class Admin::SitesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  before_action :set_big_categories, only: [:index, :search]
  
  def index
    @sites = Site.all.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to admin_sites_url, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end 
    end 
  end 

  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to admin_sites_url, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end 
    end 
  end

  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to admin_sites_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def load_small_categories
    big_category_id = params[:big_category_id].to_i
    @small_categories = SmallCategory.where(big_category_id: big_category_id)
    if request.xhr?
      render :json => {
        :file_content => @small_categories
      }
    end
  end
  
  def search
    @sites = Site.where(big_category_id: params[:big_category_id], small_category_id: params[:small_category_id]).paginate(:page => params[:page])
  end

  private
    def set_site
      @site ||= Site.find(params[:id])
    end 

    def site_params
      params.require(:site).permit(:name, :url, :big_category_id, :small_category_id)
    end
  
    def set_big_categories
      @big_categories = BigCategory.all
    end
end
