json.extract! get, :id, :title, :getimage, :body, :price, :created_at, :updated_at
json.url get_url(get, format: :json)