require 'rails_helper'

RSpec.describe OperationsController, type: :routing do
  describe 'routing' do
    let(:operations_path) { '/groups/1/operations' }

    it 'routes to #index' do
      expect(get: operations_path).to route_to('operations#index', group_id: '1')
    end

    it 'routes to #new' do
      expect(get: "#{operations_path}/new").to route_to('operations#new', group_id: '1')
    end

    it 'routes to #show' do
      expect(get: "#{operations_path}/1").to route_to('operations#show', group_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: "#{operations_path}/1/edit").to route_to('operations#edit', group_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: operations_path).to route_to('operations#create', group_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: "#{operations_path}/1").to route_to('operations#destroy', group_id: '1', id: '1')
    end
  end
end
