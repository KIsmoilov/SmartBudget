json.extract! account_record, :id, :name, :amount, :author_id, :created_at, :updated_at
json.url account_record_url(account_record, format: :json)
