class CustomizationController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create]  # Re-use for both actions
    

    def index
      @birdhouses = Birdhouse.all # This line will set @birdhouses for the view
      @customizations = current_user.customizations
      @customizations = Customization.all if current_user.role? # Ensure this line correctly checks for admin role
    end
    
   
    def create
        @customization = Customization.new(customization_params)
        @customization.user = current_user
      
        if @customization.save
          flash[:notice] = 'Customization saved successfully. We will get back to you within 2-3 working days.'
          redirect_to customization_path
        else
          @customizations = current_user.customizations 
          flash.now[:alert] = 'There was an error saving your customization: ' + @customization.errors.full_messages.to_sentence
          render :index
        end
    end
      
    
    private
  
  
    def customization_params
      params.require(:customization).permit(:birdhouse_id, :figure_image, :design_details)
    end
end
  