require 'rails_helper'

RSpec.describe 'Group page', type: :feature do
  before :each do
    @user1 = User.new({ name: 'David', email: 'david@gmail.com', password: '1234567',
                        password_confirmation: '1234567' })
    visit user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end

  it 'should be able to see SignOut option' do
    expect(page).to have_content('Sign out')
  end

  it 'should be able to redirect to add new category' do
    click_link 'Add Category'
    expect(page).to have_current_path(new_group_path)
  end

  it 'should be able to save category' do
    click_link 'Add Category'
    fill_in 'Category name', with: 'test'
    fill_in 'Icon URL', with: 'url'
    click_button 'Create Category'
    expect(page).to have_content('test')
  end
end
