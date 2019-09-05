class Product < ApplicationRecord
  belongs_to :user
  has_many   :comments   ,dependent: :destroy
  has_many   :likes,dependent: :destroy
  has_many   :images   ,dependent: :destroy
  belongs_to :category

end
