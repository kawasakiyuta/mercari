class Product < ApplicationRecord
  scope :sorted, -> {order("id DESC")}
  scope :limits, -> {limit(4)}
  scope :adjust, -> {sorted.limits }
  scope :active, -> (category){where(category_id:category)}

  has_many :images
  belongs_to :user
  has_many   :comments ,dependent: :destroy
  belongs_to :brand
  has_many   :likes   ,dependent: :destroy
  has_many   :images  ,dependent: :destroy
  belongs_to :category

end
