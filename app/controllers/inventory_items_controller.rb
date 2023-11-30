class InventoryItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_vendor_role

  def new
    @inventory_item = InventoryItem.new
  end

  def create
    @inventory_item = InventoryItem.new(inventory_item_params)
    if @inventory_item.save
      flash[:success] = "Item added successfully."
      redirect_to some_path # Change to where you want to redirect after creation
    else
      flash.now[:error] = "There was an error adding the item."
      render :new
    end
  end

  private

  def inventory_item_params
    params.require(:inventory_item).permit(:name, :description, :quantity, :price)
  end

  def check_vendor_role
    unless current_user.vendor?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end
end
