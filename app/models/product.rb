class Product < ApplicationRecord
  belongs_to :user     ,optional: true
  has_many   :comments ,dependent: :destroy
  belongs_to :brand    ,optional: true
  has_many   :likes    ,dependent: :destroy
  has_many   :categories
  has_many   :images   ,dependent: :destroy
  accepts_nested_attributes_for :images
end
