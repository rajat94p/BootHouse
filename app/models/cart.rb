class Cart < ApplicationRecord
	has_many :orderables
	has_many :products, through: :orderables	
end
