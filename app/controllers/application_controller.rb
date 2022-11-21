class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_render_cart
  before_action :initialize_cart


  def  set_render_cart
    @render_cart = true
  end

  def initialize_cart
     @cart ||= Cart.find_by(id: session[:cart_id])

     if @cart.nil?
     @cart = Cart.create
     session[:cart_id] = @cart_id
    end 
  end 
  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :phone, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end


