class WelcomeController < ApplicationController
  def index
  end
  def unregistered
    
  end
  def payment_succed
    if @shopping_cart.payed?
      cookies[:shopping_cart_id] = nil
    else
      redirect_to carrito_path
    end
    #cookies[:shopping_cart_id] = nil
  end
  protected
  	def set_layout
  		return "landing" if action_name == "unregistered"
  	end
end
