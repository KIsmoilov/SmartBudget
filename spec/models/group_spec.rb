require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    Group.new({ name: 'Mortgage', icon: 'https://www.smashbros.com/wiiu-3ds/images/character/toon_link/main.png',
                user_id: 1 })
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
