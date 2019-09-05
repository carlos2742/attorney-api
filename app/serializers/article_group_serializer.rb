class ArticleGroupSerializer < ActiveModel::Serializer

  attributes :date, :article_list

  def date
    object[0]
  end

  def article_list
    object[1].map{ |item| ArticleSerializer.new(item) }
  end
end
