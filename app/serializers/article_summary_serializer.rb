class ArticleSummarySerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :image_id, :created_at

  def title
    object.title
  end

  def summary
    "#{object.content.split(" ").take(20).join(" ")} ..."
  end
end