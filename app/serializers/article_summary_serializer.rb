class ArticleSummarySerializer < ActiveModel::Serializer
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