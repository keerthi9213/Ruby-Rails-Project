class UsersController < ApplicationController
    before_action :require_login, only: [:history]
    before_action :set_user, only: [:edit, :update]
<<<<<<< HEAD
    before_action :set_user

    def history1
        @orders = current_user.orders.includes(:line_items) # Assuming you have a method `current_user` to get the logged-in user
    end
=======
>>>>>>> f44672dae7e26d7c82666e7385e8b34a4885c09e

    def history
      @orders = current_user.orders.includes(line_items: :birdhouse)
    end
    

    def require_login
        unless current_user
          flash[:error] = "You must be signed in to view the history."
          redirect_to new_user_session_path # Assumes you're using Devise for user management
        end
    end

    def edit
        # The form will automatically load with the @user instance
    end
    
    def update
        if @user.update(user_params)
          # For a real popup message, you might use something like a JS alert or a modal
          # For simplicity here, we'll use a flash message and redirect
          flash[:success] = 'Details updated successfully.'
          redirect_to edit_user_profile_path
        else
          render :edit
        end
    end
    
    def set_user
        @user = current_user
       
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :contact_number)
        # Add any other user attributes you want to be able to change
    end
    
      
<<<<<<< HEAD

    private

    def set_user
      @user = current_user # Ensure this is correctly finding the logged-in user
    end
=======
>>>>>>> f44672dae7e26d7c82666e7385e8b34a4885c09e
end
