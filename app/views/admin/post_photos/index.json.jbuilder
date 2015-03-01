json.array!(@admin_post_photos) do |admin_post_photo|
  json.extract! admin_post_photo, :id, :title
  json.url admin_post_photo_url(admin_post_photo, format: :json)
end
