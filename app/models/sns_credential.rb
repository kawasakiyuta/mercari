class SnsCredential < ApplicationRecord
  balongs_to :user, optional: true #userのバリデーションを外す
end
