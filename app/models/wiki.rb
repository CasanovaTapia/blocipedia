class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :collaborations
  has_many :users, through: :collaborations
end
