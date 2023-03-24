require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  before :each do
    visit unauthenticated_root_path
  end

  it 'I can see the button in home page' do
    expect(page).to have_link 'LOG IN'
    expect(page).to have_link 'SIGN UP'
    expect(page).to have_selector 'h1'
  end

  it 'should be able to see login page' do
    click_on 'LOG IN'
    expect(page).to have_current_path new_user_session_path
  end

  it 'should be able to see sign up page' do
    click_on 'SIGN UP'
    expect(page).to have_current_path new_user_registration_path
  end
end
