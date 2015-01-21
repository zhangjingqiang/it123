class BigCategory < ActiveRecord::Base
  has_many :small_categories
  
  validates :name, presence: true, uniqueness: true
  
  default_scope { order('name') }
end
