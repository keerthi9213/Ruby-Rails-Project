class CartItemController < ApplicationController
    def update
        @cart_item = CartItem.find(params[:id])
        additional_quantity = params[:cart_item][:add_quantity].to_i
        new_quantity = @cart_item.quantity + additional_quantity
        if @cart_item.update(quantity: new_quantity)
          respond_to do |format|
            format.json { render json: { new_quantity: @cart_item.quantity, item_total: @cart_item.total_price, cart_total: @cart.total_price }, status: :ok }
          end
        else
          respond_to do |format|
            format.json { render json: @cart_item.errors, status: :unprocessable_entity }
          end
        end
    end
    
    private
    
    def cart_item_params
        params.require(:cart_item).permit(:quantity, :add_quantity)
    end
end
