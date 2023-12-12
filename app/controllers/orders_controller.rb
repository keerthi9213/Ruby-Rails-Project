# app/controllers/orders_controller.rb

class OrdersController < ApplicationController
    
    before_action :authenticate_user!, except: [:home]
    before_action :authenticate_user!, only: [:new, :create, :checkout] 
  
    #def new
      #@order = Order.new
      #@total_price = params[:total_price]
      #@order = Order.new(total_cost: @total_price)
      
    #end
    def create
      
      @order = current_user.orders.build(order_params)
  
      if @order.save
        current_user.cart.cart_items.destroy_all
        session.delete(:total_price)
        # Simulate a successful order placement without actual payment processing
        flash[:notice] = "Thank you for your order. Your payment has been processed."
        redirect_to thank_you_path
      else
        flash.now[:alert] = @order.errors.full_messages.to_sentence
        render :new
      end
    end

    def checkout
      session[:total_price] = @total_price
      #@cart = current_user.cart
      #@total_price = calculate_cart_total(@cart)
      @total_price = params[:total_price]
      @order = Order.new(total_cost: params[:total_price])
      #@order = Order.new(total_cost: @total_price)

    end
  
  
    private
  
    def order_params
      params.require(:order).permit(:shipping_address, :total_cost, :cardholder_name, :card_type, :card_number, :card_expiry, :card_cvv)
    end

    def show
      @order = Order.find(params[:id])
      @reviews = @order.reviews
      @review = Review.new
    end
  end
  