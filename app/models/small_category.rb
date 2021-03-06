class SmallCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :big_category
  has_many :sites, dependent: :destroy

  validates :name, presence: true
  validates :big_category_id, presence: true

  default_scope { order('name') }
end
