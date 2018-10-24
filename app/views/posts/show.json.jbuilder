json.extract! @post, :id, :title, :content, :tag, :created_at, :updated_at, :user, :comments
json.url post_url(@post, format: :json)
