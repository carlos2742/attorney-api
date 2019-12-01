class ArticleAdminSerializer < ActiveModel::Serializer
  attributes :id, :image_id, :created_at, :languages, :status

  def languages
    trans = object.translations
    {
        trans[0].lang.to_sym =>
            {
                title: trans[0].title,
                content: trans[0].content,
                permalink: trans[0].permalink,
            },
        trans[1].lang.to_sym =>
            {
                title: trans[1].title,
                content: trans[1].content,
                permalink: trans[1].permalink,
            }
    }
  end

  belongs_to :practice_area
  has_many :tags

  class PracticeAreaSerializer < ActiveModel::Serializer
    attributes :id, :languages

    def languages
      trans = object.translations
      {
          trans[0].lang.to_sym => trans[0].name,
          trans[1].lang.to_sym => trans[1].name
      }
    end
  end

  class TagSerializer < ActiveModel::Serializer
    attributes :id, :languages
    def languages
      trans = object.translations
      {
          trans[0].lang.to_sym => trans[0].name,
          trans[1].lang.to_sym => trans[1].name
      }
    end
  end
end