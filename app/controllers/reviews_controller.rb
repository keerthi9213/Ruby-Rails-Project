class ReviewsController < ApplicationController
    before_action :authenticate_user!, except: [:home]
    before_action :set_order, only: [:new, :create, :index]
  
    def new
        @review = Review.new
      end
    
      def create
        @review = @order.reviews.build(review_params)
        @review.user = current_user
    
        if @review.save
          redirect_to order_reviews_path(@order), notice: 'Review was successfully created.'
        else
          render :new
        end
      end
    
      def index
        @reviews = @order.reviews
      end
    
      private
    
      def set_order
        @order = current_user.orders.find(params[:order_id])
      end
    
      def review_params
        params.require(:review).permit(:rating, :feedback)
      end
    
end
