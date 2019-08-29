class PracticeAreaSerializer < ActiveModel::Serializer
  attributes :key, :name

  def name
    object.name
  end
end
