class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end
	
	def new
		@category =Category.new
	end

	def create
		@category =Category.new(category_params)
		if @category.save
			redirect_to categories_path
		else
			flash.now[:errors] = @category.errors.full_messages
			render :new
	end

	def edit 
		@category = Category.find(params[:id])
	end

	def update
		@category =Category.find(params[:id])
		if @category.update(category_params)
			redirect_to categories_path
		else
			flash.now[:errors] = @category.errors.full_messages
			render :new
		end

		private
		def category_params
			params.require(:category).permit(:Name)
		end



	# def show
	# 	@category = params[:category]
  # 		@category = Category.find_by(id: params[:id])
	# 	products = @category.products.where(category_id: @category)
	# end
end
