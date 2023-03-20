require 'rails_helper'

RSpec.describe 'account_records/show', type: :view do
  before(:each) do
    assign(:account_record, AccountRecord.create!(
                              name: 'Name',
                              amount: '9.99',
                              author: nil
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
