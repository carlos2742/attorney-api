class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content

  belongs_to :practice_area

  def title
    object.title
  end

  def content
    object.content
  end

end
