require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'New Product'
    fill_in 'Name', :with => 'Awesome Product'
    fill_in 'Cost', :with => 50
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Awesome Product'
  end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'Please double-check your entries'
  end
end
