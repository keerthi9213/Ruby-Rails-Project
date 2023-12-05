class CartController < ApplicationController
    before_action :authenticate_user!
    before_action :set_birdhouse, only: [:add]
    
    def add
        # Assuming the Cart and Birdhouse models are associated correctly
        cart = current_user.cart || current_user.create_cart
        birdhouse = Birdhouse.find(params[:id])
        item = cart.cart_items.find_or_initialize_by(birdhouse: birdhouse)
        item.quantity += 1
        if item.save
          flash[:notice] = "Birdhouse added to cart with quantity "+item.quantity.to_s
        else
          flash[:alert] = "Could not add birdhouse to cart."
        end
        redirect_to listings_show_path(id: birdhouse.id)
    end

    def buy
      # This action will handle the 'Buy now' functionality
      cart = current_user.cart || current_user.create_cart
      birdhouse = Birdhouse.find(params[:id])
  
      # Initialize the item with quantity 1 or increment if already in cart
      item = cart.cart_items.find_or_initialize_by(birdhouse: birdhouse)
      item.quantity += 1
  
      if item.save
        # Redirect to the cart page if the item is saved successfully
        redirect_to cart_path
      else
        # Redirect back to the birdhouse listing if the save fails
        flash[:alert] = "Could not add birdhouse to cart."
        redirect_to listings_show_path(birdhouse)
      end
    end
    
    
    def cart
      @cart = current_user.cart || current_user.create_cart
      
      # You can set default values or retrieve them from a method or database
      @shipping_fee = @cart.shipping_fee || 5.99 # Default shipping fee
      @taxes = @cart.taxes || (@cart.cart_items.sum { |item| item.quantity * item.birdhouse.price } * 0.08) # Default tax rate
      
      # Ensure the shipping fee and taxes are saved if they are default values
      if @cart.shipping_fee.nil? || @cart.taxes.nil?
        @cart.update(shipping_fee: @shipping_fee, taxes: @taxes)
      end
      
      # Calculate the total price of items
      item_total = @cart.cart_items.sum { |item| item.quantity * item.birdhouse.price }
      
      # Calculate the total price including shipping fee and taxes
      @total_price = item_total + 5.99 + 3.99
    end
    
    
    def remove_item
      cart = current_user.cart.find(params[:id])
      cart.destroy
      redirect_to cart_path, notice: 'Item was successfully removed from the cart.'
    end
    
    def set_birdhouse
        @birdhouse = Birdhouse.find(params[:id])
    end
end
