class BigCategory < ActiveRecord::Base
  has_many :small_categories
  
  validates :name, presence: true
end
