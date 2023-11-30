class UsersController < ApplicationController
    before_action :require_login, only: [:history]

    def history
        @orders = current_user.orders # Assuming you have a method `current_user` to get the logged-in user
    end

    def require_login
        unless current_user
          flash[:error] = "You must be signed in to view the history."
          redirect_to new_user_session_path # Assumes you're using Devise for user management
        end
    end
end
