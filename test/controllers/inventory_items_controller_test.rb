require "test_helper"

class InventoryItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inventory_items_new_url
    assert_response :success
  end

  test "should get create" do
    get inventory_items_create_url
    assert_response :success
  end
end
