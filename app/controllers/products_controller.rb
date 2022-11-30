class ProductsController < ApplicationController
	#before_action :category, only: %i[index, show]
	  def index
	     @products = Product.all
	     @categories = Category.all

	  end

	  def show
	    @product = Product.find(params[:id])
	    @categories = Category.all
	  end

	  def new
	    @product = Product.new
	    
	  end
	  
	  def create
	    @product = current_user.products.create(product_params)
	    if @product.save
	      redirect_to products_path
	    else
	      render :new
	    end
	  end

	  def edit
	  	@product = Product.find(params[:id])
	  end

	  def update
	    @product = Product.find(params[:id])
	    if @product.update(product_params)
	      redirect_to @product
	    else
	      render :new
	    end
	  end

	  def destroy
	    @product = Product.find(params[:id])
	    @product.destroy

	    	redirect_to root_path
	  end

	  private
	  def product_params
	    params.require(:product).permit(:name, :brand, :price, :details, :category_id, images:[])
	  end

	  # def category
	  # 	@categories = Category.find(params[:category_id])
	  # end

 end
