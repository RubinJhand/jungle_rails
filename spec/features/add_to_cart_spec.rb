require 'rails_helper'

RSpec.feature "Visitor can add an item to the empty cart", type: :feature, js:true do
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They see all products" do

    # ACT
    visit root_path
    expect(page).to have_content('My Cart (0)')

    # VERIFY
    first(:button, 'Add').click
    expect(page).to have_content('My Cart (1)')

    # DEBUG
    save_screenshot 'add_cart.png'

  end
end
