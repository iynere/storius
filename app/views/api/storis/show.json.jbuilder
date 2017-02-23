json.extract! @stori, :id, :user_id, :title, :author, :content, :image_url, :header_image_url, :metadata, :audio_video, :tags
json.annotations do
  @stori.annotations.each do |annotation|
    json.set! annotation.id do
      json.extract! annotation, :id, :start_idx, :length
    end
  end
end
json.comments do
  @stori.comments.each do |comment|
    json.set! comment.id do
      json.extract! comment, :id, :content, :user_id, :updated_at
      json.created_at time_ago_in_words(comment.created_at)
      json.username comment.user.username
    end
  end
end
