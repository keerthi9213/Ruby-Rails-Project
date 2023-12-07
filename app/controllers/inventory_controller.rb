class InventoryController < ApplicationController
    def new
        @birdhouse = Birdhouse.new
        render :new
    end

    def save
        @birdhouse = Birdhouse.new(birdhouse_params)
        if @birdhouse.build(birdhouse_params)
          redirect_to listings_path(@birdhouse), notice: 'Birdhouse was successfully created.'
        else
          render :new
        end
    end

    def birdhouse_params
        # Permit your birdhouse parameters here, for example:
        params.require(:birdhouse).permit(:figure_image, :material, :color, :style, :roof_design, :size, :artistry, :quantity)
    end


    def save1
        @birdhouse = Birdhouse.new(birdhouse_params)
      
        if @birdhouse.save
          redirect_to listings_path(@birdhouse), notice: 'Birdhouse was successfully created.'
        else
          render :new
        end
    end

    def save2
        @birdhouse = Birdhouse.create(birdhouse_params)
        if @birdhouse.persisted?
          redirect_to listings_path(@birdhouse), notice: 'Birdhouse was successfully created.'
        else
          render :new
        end
    end
      
      
      
end
