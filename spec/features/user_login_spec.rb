require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
   before :each do 
    User.create!(
    first_name: 'Jasper', 
    last_name: 'Peppermint', 
    email: 'jpeppermint@fictionalmail.com', 
    password: 'Mmmmm', 
    password_confirmation: 'Mmmmm'
    )
  end

  scenario "They complete the login form and are successfully logged in" do

    # ACT
    visit root_path
    expect(page).to have_content 'Login'

    # VERIFY
    click_on 'Login'
    fill_in 'email', with: 'jpeppermint@fictionalmail.com'
    fill_in 'password', with: 'Mmmmm'
    click_on 'Submit'

    expect(page).to have_content 'Signed in as Jasper'

    # DEBUG
    save_screenshot 'user_login.png'

  end
end
