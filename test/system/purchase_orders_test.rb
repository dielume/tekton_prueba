require "application_system_test_case"

class PurchaseOrdersTest < ApplicationSystemTestCase
  setup do
    @purchase_order = purchase_orders(:one)
  end

  test "visiting the index" do
    visit purchase_orders_url
    assert_selector "h1", text: "Purchase Orders"
  end

  test "creating a Purchase order" do
    visit purchase_orders_url
    click_on "New Purchase Order"

    fill_in "Description", with: @purchase_order.description
    fill_in "Photo", with: @purchase_order.photo
    fill_in "Reception date", with: @purchase_order.reception_date
    fill_in "Shipping date", with: @purchase_order.shipping_date
    fill_in "Status", with: @purchase_order.status
    fill_in "User", with: @purchase_order.user_id
    click_on "Create Purchase order"

    assert_text "Purchase order was successfully created"
    click_on "Back"
  end

  test "updating a Purchase order" do
    visit purchase_orders_url
    click_on "Edit", match: :first

    fill_in "Description", with: @purchase_order.description
    fill_in "Photo", with: @purchase_order.photo
    fill_in "Reception date", with: @purchase_order.reception_date
    fill_in "Shipping date", with: @purchase_order.shipping_date
    fill_in "Status", with: @purchase_order.status
    fill_in "User", with: @purchase_order.user_id
    click_on "Update Purchase order"

    assert_text "Purchase order was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase order" do
    visit purchase_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase order was successfully destroyed"
  end
end
