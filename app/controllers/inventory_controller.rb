class InventoryController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_vendor, only: [:show]
    def show
        #@inventory = current_user.inventory
        #@birdhouses = @inventory.birdhouses
        @inventory = current_user.inventory || create_inventory_for_user
        if @inventory.nil?
            # Handle the case where the inventory does not exist.
            # You could redirect to a different page or show a message.
            redirect_to new_inventory_path, alert: 'You do not have an inventory. Please create one.'
        end
        def create_inventory_for_user
            # Logic to create a new inventory for the user.
            # This could be as simple as:
            current_user.create_inventory
            # But might involve more setup depending on your application requirements.
        end
        #@birdhouses = Birdhouse.find(params[:id])
        # ... logic to show inventory ...
    end

    private

    def verify_vendor
        unless current_user.vendor?
          redirect_to inventory_path, alert: 'You must be a vendor to access this page.'
        end
    end


end
