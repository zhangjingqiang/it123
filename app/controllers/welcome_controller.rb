class WelcomeController < ApplicationController
  def index
    @big_categories = BigCategory.all.order('name')
    @small_categories = SmallCategory.where(big_category_id: @big_categories.map.with_index { |big, index| big.id if index == 0 })
  end
end
