require 'rails_helper'

describe 'user sign in process' do
  it 'allow exisiting user to sign in' do
    FactoryBot.create(:user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => 'rey@test.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'displays error if user does not exist' do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => 'rey@test.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'displays error if email is left blank' do
    FactoryBot.create(:user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'displays error if password is left blank' do
    FactoryBot.create(:user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => 'rey@test.com'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

end
