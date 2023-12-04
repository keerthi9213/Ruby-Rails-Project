# app/controllers/orders_controller.rb

class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]  # Assuming you're using Devise for user authentication
  
    def new
      @order = Order.new
    end
  
    def create
      @order = current_user.orders.build(order_params)
  
      if @order.save
        # Simulate a successful order placement without actual payment processing
        flash[:notice] = "Thank you for your order. Your payment has been processed."
        redirect_to thank_you_path
      else
        flash.now[:alert] = @order.errors.full_messages.to_sentence
        render :new
      end
    end
  
    private
  
    def order_params
      params.require(:order).permit(:shipping_address, :total_cost, :card_number, :card_expiry, :card_cvv, :cardholder_name)
    end
  end
  