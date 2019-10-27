class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  scope :sorted, -> {order("id DESC")}
  scope :limits, -> {limit(4)}
  scope :adjust, -> {sorted.limits }
  scope :active, -> (category){where(category_id:category)}

  belongs_to :user     ,optional: true
  belongs_to :brand, optional: true
  belongs_to :category
  belongs_to_active_hash :address
  has_many   :comments ,dependent: :destroy
  has_many   :likes   ,dependent: :destroy
  has_many   :images  ,dependent: :destroy
  accepts_nested_attributes_for :images

  enum day_to_ship: {"1~2日で発送": 1, "2~3日で発送": 2 ,"4~7日で発送": 3}
end
