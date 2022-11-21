class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  has_many :products 
end
