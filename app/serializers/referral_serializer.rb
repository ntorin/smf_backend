class ReferralSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :referrer_id
end
