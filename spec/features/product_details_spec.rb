require 'rails_helper'

RSpec.feature "Visitor clicks one of the product partials and goes to new page", type: :feature, js: true do

    # SETUP
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

    # VERIFY
    page.first('article.product').find('h4').click
    find('a.btn-default').click
    expect(page).to have_css 'article.product'
    expect(page).to have_content('Price')

    # DEBUG
    save_screenshot 'product_details.png'

  end
end 
