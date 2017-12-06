require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    visit products_path
    click_link 'New Product'
    fill_in 'Name', :with => 'Awesome Product'
    fill_in 'Cost', :with => 50
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    click_link 'Awesome Product'
    click_link 'Add Review'
    fill_in 'Author', :with => 'Happy Customer'
    fill_in 'Content body', :with => 'I love this product so much I decided to write a review that is at least 50 characters long'
    choose(option: 5)
    click_on 'Create Review'
    expect(page).to have_content 'Happy Customer'
  end

  # it "gives error when no name is entered" do
  #   visit new_product_path
  #   click_on 'Create Product'
  #   expect(page).to have_content 'Please double-check your entries'
  # end
end
