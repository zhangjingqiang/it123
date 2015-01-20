class AdminController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'
  
  def index
  end
end
