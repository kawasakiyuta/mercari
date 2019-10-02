class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many   :comments,dependent: :destroy
  has_many   :messages,dependent: :destroy
  has_many   :products,dependent: :destroy
  has_many   :evaluations,dependent: :destroy
  has_many   :likes
  has_one    :card
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        nickname:  auth.info.name,
        password: Devise.friendly_token[0, 20],
        # image:  auth.info.image,
        birthday: "2010-11-11",
        first_name: "face",
        last_name: "book",
        first_name_kana: "ふぇいす",
        last_name_kana: "ぶっく",
        phone_number: "000-0000-0000",
        postcode: "000-0000",
        prefecture: "0000",
        city: "0000",
        block: "0000",
        wallet: "0000"
      )
    end

    user
  end
end
