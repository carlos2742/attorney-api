class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image_id, :updated_at, :permalinks

  belongs_to :practice_area
  has_many :tags

  def title
    object.title
  end

  def content
    object.content
  end

  def permalinks
    object.permalinks
  end

end
