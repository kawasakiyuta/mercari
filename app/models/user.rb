class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many   :comments,dependent: :destroy
  has_many   :messages,dependent: :destroy
  has_many   :products,dependent: :destroy
  has_many   :evaluations,dependent: :destroy
  has_many   :likes
  has_one :card
end
