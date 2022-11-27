class HomesController < ApplicationController
  def index
    @homes = Product.all
  end

  def tc
    @tc = TC.all
  end
end
