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

  it 'displays error if username is blank' do
    visit '/users/sign_up'
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Password', :with => '123456'
    fill_in 'Password confirmation', :with => '123456'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

  it 'displays error if email is blank' do
    visit '/users/sign_up'
    fill_in 'Username', :with => 'Rey'
    fill_in 'Password', :with => '123456'
    fill_in 'Password confirmation', :with => '123456'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

  it 'displays error if password is blank' do
    visit '/users/sign_up'
    fill_in 'Username', :with => 'Rey'
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Password confirmation', :with => '123456'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

  it 'displays error if password confirmation is blank' do
    visit '/users/sign_up'
    fill_in 'Username', :with => 'Rey'
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Password', :with => '123456'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

  it 'displays error if password is not at least 6 characters' do
    visit '/users/sign_up'
    fill_in 'Username', :with => 'Rey'
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Password', :with => '123'
    fill_in 'Password confirmation', :with => '123'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

  it 'displays error if password and password confirmation do not match' do
    visit '/users/sign_up'
    fill_in 'Username', :with => 'Rey'
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Password', :with => '123456'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

  it 'email must contain an @' do
    visit '/users/sign_up'
    fill_in 'Username', :with => 'Rey'
    fill_in 'Email', :with => 'test.com'
    fill_in 'Password', :with => '123456'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

  it 'email must contain an .com' do
    visit '/users/sign_up'
    fill_in 'Username', :with => 'Rey'
    fill_in 'Email', :with => 'test@'
    fill_in 'Password', :with => '123456'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end

end
