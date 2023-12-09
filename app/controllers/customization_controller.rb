class CustomizationController < ApplicationController
    before_action :set_birdhouses_and_themes, only: [:index, :create]  # Re-use for both actions
    
    def index
      # @birdhouses and @themes are set via the before_action
    end
  
    def create1
      @customization = Customization.new(customization_params)
      @customization.user = current_user # Assuming Devise for user authentication
  
      if @customization.save
        flash[:notice] = 'Customization saved successfully!'
        redirect_to customization_path
      else
        flash.now[:alert] = 'There was an error saving your customization.'
        render :index
      end
    end

    def create
        @customization = Customization.new(customization_params)
        @customization.user = current_user
      
        if @customization.save
          flash[:notice] = 'Customization saved successfully!'
          redirect_to customization_path
        else
          flash.now[:alert] = 'There was an error saving your customization: ' + @customization.errors.full_messages.to_sentence
          render :index
        end
      end
      
    
    private
  
    def set_birdhouses_and_themes
      @birdhouses = Birdhouse.all
      @themes = ['Spring Blossom', 'Autumn Twilight', 'Winter Wonderland', 'Summer Solstice']
    end
  
    def customization_params
      params.require(:customization).permit(:birdhouse_id, :theme, :design_details)
    end
  end
  