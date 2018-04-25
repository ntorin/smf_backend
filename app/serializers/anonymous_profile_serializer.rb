class AnonymousProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :name_color
end
