class TagSerializer < ActiveModel::Serializer
  attributes :name

  def name
    object.name
  end

end
