class LineItemsController < ApplicationController
	 before_action :authenticate_user
   before_action :line_variable, only: %i[edit update destroy add_quantity reduce_quantity]
   
   def index
    @line_items = LineItem.all
   end

   def new
    @line_item = LineItem.new
  end


  def create
    @line_items = LineItem.all
    @line_item = current_user.cart.line_items.create(product_id: params[:id])
        respond_to do |format|
            if @line_item.save
                format.js
            else 
                redirect_to :back , notice: "item is not added to cart"
            end
        end
    end

  def destroy
     respond_to do |format|
            if @line_item.delete
                format.js
            else
                redirect_to :back , notice: "item is not added to cart"
            end
        end  
    end

  def add_quantity
     respond_to do |format|
            if @line_item.update(quantity: @line_item.quantity + 1)
                format.js
            else
                format.html
            end
        end
    end

  def reduce_quantity
     respond_to do |format|
            if @line_item.update(quantity: @line_item.quantity + 1)
                format.js
            else
                format.html
            end
        end
    end
  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id, :cart_id)
  end


  def line_variable
    @line_item = LineItem.find(params[:id])
  end
end
