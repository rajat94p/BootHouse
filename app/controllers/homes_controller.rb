class HomesController < ApplicationController
  def index
    @homes = Product.all
  end
end
