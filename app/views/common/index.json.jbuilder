json.array! @posts do |post|
  json.post do
    json.id post.id
    json.title post.title
    json.content post.content
    json.user post.user
    json.comment post.comments.count
  end
end
