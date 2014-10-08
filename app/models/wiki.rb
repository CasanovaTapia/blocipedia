class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  has_many :collaborations
  has_many :users, through: :collaborations
end
