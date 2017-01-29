class BigCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :small_categories, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  default_scope { order('name') }
end
