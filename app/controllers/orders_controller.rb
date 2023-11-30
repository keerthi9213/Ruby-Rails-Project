# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
    def confirm
        @cart_item = fetch_cart_item
        @order_total = params[:price].to_f # assuming price is passed as a parameter
      end
  
    private
  
    def fetch_cart_item
      # Add logic to fetch the cart item, depending on your application's structure
      # For example, if you are using a session to store the cart, you might retrieve it like this:
      cart_item_id = session[:cart_item_id]
      cart_item = CartItem.find_by(id: cart_item_id)
      cart_item
    end
  
    def calculate_order_total
      # Add logic to calculate the total order amount based on cart items, quantity, and price
      # For simplicity, let's assume you have a 'price' attribute in CartItem
      # and you want to display the total as the product of quantity and price
      if @cart_item
        @cart_item.quantity * @cart_item.price
      else
        0  # Or handle the case where there is no cart item
      end
    end

    
  end
  