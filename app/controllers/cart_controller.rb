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
          flash[:notice] = "Birdhouse added to cart."
        else
          flash[:alert] = "Could not add birdhouse to cart."
        end
        redirect_to listings_show_path(id: birdhouse.id)
    end
    
    
    def cart
        @cart = current_user.cart || current_user.create_cart
        @shipping_fee = @cart.shipping_fee
        @taxes = @cart.taxes
        @total_price = @cart.total_price
    end

    
    def set_birdhouse
        @birdhouse = Birdhouse.find(params[:id])
    end
end
