class Cart < ApplicationRecord
	has_many :orderables
	has_many :products, through: :line_items	
	belongs_to :user

end
