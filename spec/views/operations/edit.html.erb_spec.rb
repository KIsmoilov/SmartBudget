require 'rails_helper'

RSpec.describe 'operations/edit', type: :view do
  let(:operation) do
    Operation.create!(
      name: 'MyString',
      amount: 1
    )
  end

  before(:each) do
    assign(:operation, operation)
  end

  it 'renders the edit operation form' do
    render

    assert_select 'form[action=?][method=?]', operation_path(operation), 'post' do
      assert_select 'input[name=?]', 'operation[name]'

      assert_select 'input[name=?]', 'operation[amount]'
    end
  end
end
