require 'rails_helper'

RSpec.describe Operation, type: :model do
  subject do
    user = User.create(name: 'Test', password: 'password', email: 'test@gmail.com')
    Operation.new(name: 'Bag', amount: 200.4, user:)
  end

  before { subject.save }

  it 'should have valid name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have valid amount' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
