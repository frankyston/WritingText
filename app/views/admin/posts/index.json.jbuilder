json.array!(@admin_posts) do |admin_post|
  json.extract! admin_post, :id, :name, :resume, :message, :admin_category_id
  json.url admin_post_url(admin_post, format: :json)
end
