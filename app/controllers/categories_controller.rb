class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end
	def new
	end
	
	def show
		@category = params[:category]
  		@category = Category.find_by(id: params[:id])
		products = @category.products.where(category_id: @category)
	end

	private
		def category_params
				params.require(:category).permit(:name)
		end



	
end
