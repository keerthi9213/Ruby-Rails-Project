class CustomizationController < ApplicationController
    def index
        @birdhouses = Birdhouse.all
        # Define themes or fetch them if they are dynamically generated
        @themes = ['Spring Blossom', 'Autumn Twilight', 'Winter Wonderland', 'Summer Solstice']
    end

    def create
        # Assuming Customization model has user_id, birdhouse_id, theme, and design_details attributes
        @customization = Customization.new(customization_params)
        @customization.user = current_user # Assuming Devise for user authentication
    
        if @customization.save
          flash[:notice] = 'Customization saved successfully!'
          redirect_to customization_path
        else
          flash[:alert] = 'There was an error saving your customization.'
          render :index
        end
    end
    
    private

    def customization_params
        params.require(:customization).permit(:user_id, :birdhouse_id, :theme, :design_details)
    end
    
      
end
