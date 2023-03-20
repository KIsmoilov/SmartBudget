require 'rails_helper'

RSpec.describe 'account_records/edit', type: :view do
  let(:account_record) do
    AccountRecord.create!(
      name: 'MyString',
      amount: '9.99',
      author: nil
    )
  end

  before(:each) do
    assign(:account_record, account_record)
  end

  it 'renders the edit account_record form' do
    render

    assert_select 'form[action=?][method=?]', account_record_path(account_record), 'post' do
      assert_select 'input[name=?]', 'account_record[name]'

      assert_select 'input[name=?]', 'account_record[amount]'

      assert_select 'input[name=?]', 'account_record[author_id]'
    end
  end
end
