class ArticleGroupSerializer < ActiveModel::Serializer

  class ArticleSerializer < ActiveModel::Serializer
    attributes :id, :title, :summary, :image_id, :updated_at, :permalinks, :time_published

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

    def time_published
      (object.updated_at - DateTime.now).to_i.abs/3600
    end
  end

  def serializable_hash
    articles = object.map do | model |
      ArticleSerializer.new(model, root: false)
    end
    {total: @total, data: articles}
  end

  def add_total (total)
    @total = total
  end

  private

  def serialized_some_models some_models
    some_models.map{ |some_model| ArticleSerializer.new(some_model, root: false) }
  end

end
