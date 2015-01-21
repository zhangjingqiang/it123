class Site < ActiveRecord::Base
  belongs_to :small_category
  
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :big_category_id, presence: true
  validates :small_category_id, presence: true
  
  default_scope { order('name') }
end
