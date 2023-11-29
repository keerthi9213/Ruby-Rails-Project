class BirdhouseController < ApplicationController
    def listings
        @birdhouses = Birdhouse.all
        # Additional logic for filtering/sorting can be added here
    end
    def listings_show
        @birdhouse = Birdhouse.find(params[:id])
    end
end
