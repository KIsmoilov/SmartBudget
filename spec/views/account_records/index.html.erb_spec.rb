require 'rails_helper'

RSpec.describe 'account_records/index', type: :view do
  before(:each) do
    assign(:account_records, [
             AccountRecord.create!(
               name: 'Name',
               amount: '9.99',
               author: nil
             ),
             AccountRecord.create!(
               name: 'Name',
               amount: '9.99',
               author: nil
             )
           ])
  end

  it 'renders a list of account_records' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
