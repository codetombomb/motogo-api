class OwnerSerializer < ActiveModel::Serializer
  attributes :id
  has_many :bikes
  has_many :posts
end
