class BirdhouseController < ApplicationController
    before_action :authenticate_user!
    before_action :check_if_vendor, only: [:inventory]
    before_action :set_birdhouse, only: [:edit, :update, :show, :destroy]
    def listings
        @birdhouses = Birdhouse.all

        if params[:material].present?
            @birdhouses = @birdhouses.where("material = ?", params[:material])
        end
        if params[:roof_design].present?
            @birdhouses = @birdhouses.where("roof_design = ?", params[:roof_design])
        end
        if params[:size].present?
            @birdhouses = @birdhouses.where("size = ?", params[:size])
        end

    end 
    def listings_show
        @birdhouse = Birdhouse.find(params[:id])
    end

    def gallery
        @birdhouses = Birdhouse.all
    end

    def index
        @birdhouses = Birdhouse.all
    end

    def inventory
        @birdhouses = Birdhouse.all
    end
    
    def upvote
        birdhouse = Birdhouse.find(params[:id])
        # Here you would increase the likes count and save the birdhouse
        birdhouse.likes += 1
        birdhouse.save
        # For the simulation, we're just redirecting back to the gallery
        redirect_to gallery_path, notice: 'You have upvoted a birdhouse!'
    end

    def edit
        @birdhouse = Birdhouse.find(params[:id])
    end

    def update
        #@birdhouse = Birdhouse.find(params[:id])
        if @birdhouse.update(birdhouse_params)
          redirect_to listings_show_path(@birdhouse), notice: 'Birdhouse was successfully updated.'
        else
          render :edit
        end
    end
    def destroy
        @birdhouse = Birdhouse.find(params[:id])
        if @birdhouse.destroy
            redirect_to inventory_path, notice: "Birdhouse deleted successfully"
        else
            redirect_to inventory_path, notice: "There was an error in deleting the birdhouse"
        end
    end

      def set_birdhouse
        @birdhouse = Birdhouse.find(params[:id])
      #rescue ActiveRecord::RecordNotFound
       # redirect_to birdhouses_path, alert: "Birdhouse not found."
      end
      def check_if_vendor
        unless current_user.role?
        redirect_to listings_path, alert: "You are not authorized to view inventory page."
        end
    end

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
