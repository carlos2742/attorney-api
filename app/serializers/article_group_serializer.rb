class ArticleGroupSerializer < ActiveModel::Serializer

  class ArticleSerializer < ActiveModel::Serializer
    attributes :id, :title, :image_id, :updated_at, :permalinks

    belongs_to :practice_area
    has_many :tags

    def title
      object.title
    end

    def permalinks
      object.permalinks
    end

  end

  def serializable_hash
    @object.map do |some_group_key, some_models|
      [ some_group_key , serialized_some_models(some_models) ]
    end.to_h
  end

  private

  def serialized_some_models some_models
    some_models.map{ |some_model| ArticleSerializer.new(some_model, root: false) }
  end

end
