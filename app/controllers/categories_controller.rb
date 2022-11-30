class CategoriesController < ApplicationController
	before_action :category, only:[:show, :edit, :update, :destroy]


	def show
		@category = Category.all
	end

	
	private
		def category_params
			params.require(:category).permit(:name)
		end
end
