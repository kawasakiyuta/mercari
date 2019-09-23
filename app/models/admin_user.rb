class AdminUser < ApplicationRecord
  devise :database_aythenticatable, :omniauthable, :trackable, :validatable
end
