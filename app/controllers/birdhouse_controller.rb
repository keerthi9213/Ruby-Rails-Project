class BirdhouseController < ApplicationController
    before_action :authenticate_user!
    before_action :check_if_vendor, only: [:inventory]
    def listings
        @birdhouses = Birdhouse.all
        # Additional logic for filtering/sorting can be added here
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

    private

    def check_if_vendor
        unless current_user.role?
        redirect_to listings_path, alert: "You are not authorized to view this page."
        end
    end

end
