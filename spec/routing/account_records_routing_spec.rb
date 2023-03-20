require 'rails_helper'

RSpec.describe AccountRecordsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/account_records').to route_to('account_records#index')
    end

    it 'routes to #new' do
      expect(get: '/account_records/new').to route_to('account_records#new')
    end

    it 'routes to #show' do
      expect(get: '/account_records/1').to route_to('account_records#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/account_records/1/edit').to route_to('account_records#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/account_records').to route_to('account_records#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/account_records/1').to route_to('account_records#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/account_records/1').to route_to('account_records#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/account_records/1').to route_to('account_records#destroy', id: '1')
    end
  end
end
