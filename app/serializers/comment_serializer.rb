class CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :created_at
end
