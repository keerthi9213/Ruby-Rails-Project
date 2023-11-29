class BirdhouseController < ApplicationController
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

    def upvote
        birdhouse = Birdhouse.find(params[:id])
        # Here you would increase the likes count and save the birdhouse
        birdhouse.likes += 1
        birdhouse.save
        # For the simulation, we're just redirecting back to the gallery
        redirect_to gallery_path, notice: 'You have upvoted a birdhouse!'
    end
end
