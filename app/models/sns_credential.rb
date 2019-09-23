class SnsCredential < ApplicationRecord
  belongs_to :user, optical: true #userのバリデーションを外す
end
