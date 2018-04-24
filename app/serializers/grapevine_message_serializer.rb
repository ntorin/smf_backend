class GrapevineMessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :group_id, :message, :is_anonymous
end
