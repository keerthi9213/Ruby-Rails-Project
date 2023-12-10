class InventoryController < ApplicationController
  def new
        @birdhouse = Birdhouse.new
        render :new
  end

  def save
      @birdhouse = Birdhouse.new(birdhouse_params)
      
      if @birdhouse.save
         redirect_to listings_show_path(@birdhouse), notice: 'Birdhouse was successfully created.'
      else
         render :new
      end
  end

  def birdhouse_params
      # Permit your birdhouse parameters here, for example:
      params.require(:birdhouse).permit(:figure_image, :material, :color, :style, :roof_design, :size, :artistry, :quantity, :price)
  end
      
      
      
end
