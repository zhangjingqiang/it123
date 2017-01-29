class Site < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :small_category

  validates :name, presence: true
  validates :url, presence: true
  validates :big_category_id, presence: true
  validates :small_category_id, presence: true

  default_scope { order('name') }
end
