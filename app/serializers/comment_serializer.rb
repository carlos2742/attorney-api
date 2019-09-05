class CommentSerializer < ActiveModel::Serializer
  attributes :name, :content, :created_at, :comments

  def comments
    object.comments.map do |comment|
      CommentSerializer.new(comment)
    end
  end
end
