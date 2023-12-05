class UsersController < ApplicationController
    before_action :require_login, only: [:history]
    before_action :set_user

    def history
        @orders = current_user.orders.includes(:line_items) # Assuming you have a method `current_user` to get the logged-in user
    end

    def require_login
        unless current_user
          flash[:error] = "You must be signed in to view the history."
          redirect_to new_user_session_path # Assumes you're using Devise for user management
        end
    end

    private

    def set_user
      @user = current_user # Ensure this is correctly finding the logged-in user
    end
end
