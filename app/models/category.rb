class Category < ApplicationRecord
  has_many   :products   ,dependent: :destroy
  has_ancestry
  has_many :products
end
