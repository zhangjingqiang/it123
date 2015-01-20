class Admin::SmallCategoriesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  before_action :set_small_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @small_categories = SmallCategory.all.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @small_category = SmallCategory.new
  end

  def edit
  end

  def create
    @small_category = SmallCategory.new(small_category_params)

    respond_to do |format|
      if @small_category.save
        format.html { redirect_to admin_small_categories_url, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @small_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @small_category.errors, status: :unprocessable_entity }
      end 
    end 
  end 

  def update
    respond_to do |format|
      if @small_category.update(small_category_params)
        format.html { redirect_to admin_small_categories_url, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @small_category.errors, status: :unprocessable_entity }
      end 
    end 
  end

  def destroy
    @small_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_small_categories_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_small_category
      @small_category ||= SmallCategory.find(params[:id])
    end 

    def small_category_params
      params.require(:small_category).permit(:name, :big_category_id)
    end
end
