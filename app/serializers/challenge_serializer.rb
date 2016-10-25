class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :payload, :score
end
