class ProductsController < ApplicationController
	#before_action :category, only: %i[index, show]
	  def index
	  	if params[:id] 
	  	  @products = Product.where(category_id: params[:id])
	     else
	     	@products = Product.all
	     end
	  end

	  def show
	    @categories = Category.all
	  end

	  def new
	    @product = Product.new
	    @categories = Category.all
	    
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
	    params.require(:product).permit(:name, :brand, :price, :category_id, :details, images:[])
	  end

	  # def category
	  # 	@categories = Category.find(params[:category_id])
	  # end

 end
