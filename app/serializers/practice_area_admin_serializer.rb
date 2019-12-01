class PracticeAreaAdminSerializer < ActiveModel::Serializer
  attributes :id, :languages

  def languages
    trans = object.translations
    {
        trans[0].lang.to_sym => trans[0].name,
        trans[1].lang.to_sym => trans[1].name
    }
  end
end