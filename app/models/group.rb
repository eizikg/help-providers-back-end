class Group < ApplicationRecord
  acts_as_mappable
  has_many :group_volounteers, dependent: :destroy
  has_many :volounteers, through: :group_volounteers
  has_many :events, dependent: :destroy


  validates :name,
          uniqueness: true

end
