class ArticleGroupSerializer < ActiveModel::Serializer

  class ArticleSerializer < ActiveModel::Serializer
    attributes :id, :title, :summary, :image_id, :updated_at, :permalinks

    belongs_to :practice_area
    has_many :main_tags

    def title
      object.title
    end

    def summary
      "#{object.content.split(" ").take(40).join(" ")} ..."
    end

    def permalinks
      object.permalinks
    end

  end

  def serializable_hash
    groups = @object.map do |some_group_key, some_models|
      [ some_group_key , serialized_some_models(some_models) ]
    end.to_h
    {total: @total, groups: groups}
  end

  def add_total (total)
    @total = total
  end

  private

  def serialized_some_models some_models
    some_models.map{ |some_model| ArticleSerializer.new(some_model, root: false) }
  end

end
