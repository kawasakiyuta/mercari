class Product < ApplicationRecord

  scope :sorted, -> {order("id DESC")}
  scope :limits, -> {limit(4)}
  scope :adjust, -> {sorted.limits }
  scope :active, -> (category){where(category_id:category)}

  belongs_to :user     ,optional: true
  has_many   :comments ,dependent: :destroy
  belongs_to :brand, optional: true
  has_many   :likes   ,dependent: :destroy
  has_many   :images  ,dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :category

  # enum state: {新品、未使用: 1, 未使用に近い: 2, 目立った傷や汚れなし: 3, やや傷や汚れあり: 4, 傷や汚れあり: 5, 全体的に状態が悪い: 6 }
  # enum state: {unused: 1, near_unused: 2, no_dirts: 3, some_dirts: 4, have_dirts: 5, bad_condition: 6}
end
