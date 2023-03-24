require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new({ name: 'David', email: 'david@gmail.com', password: '1234567', password_confirmation: '1234567' })
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'Password must have length greater then 6' do
    subject.password = '12345'
    expect(subject).to_not be_valid
  end
end
