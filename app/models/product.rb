class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :category_id, presence: true
  belongs_to :category

  has_many :line_items
end
