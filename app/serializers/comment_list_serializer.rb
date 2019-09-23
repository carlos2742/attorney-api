class CommentListSerializer < ActiveModel::Serializer

  def serializable_hash
    list = @object.map do |some_models|
      CommentSerializer.new(some_models, root:false)
    end
    {total: @object.count, comments: list}
  end
end
