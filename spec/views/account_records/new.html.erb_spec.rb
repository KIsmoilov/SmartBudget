require 'rails_helper'

RSpec.describe 'account_records/new', type: :view do
  before(:each) do
    assign(:account_record, AccountRecord.new(
                              name: 'MyString',
                              amount: '9.99',
                              author: nil
                            ))
  end

  it 'renders new account_record form' do
    render

    assert_select 'form[action=?][method=?]', account_records_path, 'post' do
      assert_select 'input[name=?]', 'account_record[name]'

      assert_select 'input[name=?]', 'account_record[amount]'

      assert_select 'input[name=?]', 'account_record[author_id]'
    end
  end
end
