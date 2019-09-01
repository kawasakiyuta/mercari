class Product < ApplicationRecord
  has_many :images
  belongs_to :user
  has_many   :comments ,dependent: :destroy
  belongs_to :brand
  has_many   :likes   ,dependent: :destroy
  has_many   :images  ,dependent: :destroy
  belongs_to :category
end
