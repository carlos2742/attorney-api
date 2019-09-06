class ArticleGroupSerializer < ActiveModel::Serializer

  attributes :date, :article_list

  def date
    date = object.first
    date
  end

  def article_list
    article_list = object.last.map{ |item| ArticleSerializer.new(item) }
    article_list
  end
end
