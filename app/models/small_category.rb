class SmallCategory < ActiveRecord::Base
  belongs_to :big_category
  has_many :sites
  
  validates :name, presence: true
  validates :big_category_id, presence: true
  
  default_scope { order('name') }
end
