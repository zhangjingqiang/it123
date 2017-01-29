class Admin::BigCategoriesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  before_action :set_big_category, only: [:show, :edit, :update, :destroy]

  def index
    @big_categories = BigCategory.all.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @big_category = BigCategory.new
  end

  def edit
  end

  def create
    @big_category = BigCategory.new(big_category_params)

    respond_to do |format|
      if @big_category.save
        format.html { redirect_to admin_big_categories_url, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @big_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @big_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @big_category.update(big_category_params)
        format.html { redirect_to admin_big_categories_url, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @big_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @big_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_big_categories_url, notice: 'Successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_big_category
      @big_category ||= BigCategory.friendly.find(params[:id])
    end

    def big_category_params
      params.require(:big_category).permit(:name)
    end
end
