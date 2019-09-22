class Product < ApplicationRecord

  scope :sorted, -> {order("id DESC")}
  scope :limits, -> {limit(4)}
  scope :adjust, -> {sorted.limits }
  scope :active, -> (category){where(category_id:category)}

  has_many :images
  belongs_to :user     ,optional: true
  has_many   :comments ,dependent: :destroy
  belongs_to :brand, optional: true
  has_many   :likes   ,dependent: :destroy
  has_many   :images  ,dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :category

end
