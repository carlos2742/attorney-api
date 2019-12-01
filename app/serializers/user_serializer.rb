class UserSerializer < ActiveModel::Serializer
  attributes :id, :image_id, :created_at, :role, :name, :email

  def role
    User.rols[object.rol]
  end

end