require 'rails_helper'

describe 'Create a new account process' do
  it 'creates a new account' do
    visit '/'
    click_link "Sign up"
    fill_in 'user_email', :with => 'john@gmail.com'
    fill_in 'user_password', :with => '12345'
    fill_in 'user_password_confirmation', :with => '12345'
    click_on 'Sign Up'
    expect(page).to have_content "You've succesfully signed up!"
  end

  it 'gives error when no email is entered' do
    visit '/'
    click_link "Sign up"
    click_on "Sign Up"
    expect(page).to have_content 'problem'
  end

end
