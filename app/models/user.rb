class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :collaborations
  has_many :wikis, through: :collaborations

  def role?(base_role)
    role == base_role.to_s
  end
end
