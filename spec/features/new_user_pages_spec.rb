require 'rails_helper'

describe 'creating user account process' do
  it 'creates a new account' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Username', :with => 'Rey'
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Password', :with => '123456'
    fill_in 'Password confirmation', :with => '123456'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome!'
  end
end
