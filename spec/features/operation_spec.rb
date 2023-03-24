require 'rails_helper'

RSpec.describe 'Operation page', type: :feature do
  before :each do
    @user1 = User.new({ name: 'David', email: 'david@gmail.com', password: '1234567',
                        password_confirmation: '1234567' })
    @category = Group.create({ name: 'Mortgage',
                               icon: 'https://www.smashbros.com/wiiu-3ds/images/character/toon_link/main.png',
                               user_id: @user1.id })
    visit user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end

  it 'should be able to see exchanges' do
    click_on 'Mortgage'
    expect(page).to have_content('Add Transaction')
  end

  it 'should be able to redirect to add new trasaction' do
    click_on 'Mortgage'
    click_on 'Add Transaction'
    expect(page).to have_content('You can choose one or more categories')
  end

  it 'should be able to save transaction' do
    click_on 'Mortgage'
    click_on 'Add Transaction'
    fill_in 'Transaction name', with: 'Food'
    fill_in 'Amount', with: 5
    select 'Mortgage'
    click_on 'Create Transaction'
    expect(page).to have_content('Food')
  end
end
