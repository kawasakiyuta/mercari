class Product < ApplicationRecord
  belongs_to :user
  has_many   :comments ,dependent: :destroy
  belongs_to :brand
  has_many   :likes   ,dependent: :destroy
  belongs_to :category
  has_many   :images  ,dependent: :destroy
  accepts_nested_attributes_for :images
end
