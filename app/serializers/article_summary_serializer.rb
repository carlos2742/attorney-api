class ArticleSummarySerializer < ActiveModel::Serializer

  class ArticleSerializer < ActiveModel::Serializer
    attributes :id, :title, :summary, :image_id, :created_at

    def title
      es_translation.title
    end

    def summary
      "#{es_translation.content.split(" ").take(20).join(" ")} ..."
    end

    def es_translation
      object.translations.find_by_lang(:es)
    end
  end

  def serializable_hash
    data = @object.map do |some_models|
      serialized_some_models(some_models)
    end
    {total: @total, data: data}
  end

  def add_total (total)
    @total = total
  end

  private

  def serialized_some_models(some_model)
    ArticleSerializer.new(some_model, root: false)
  end

end