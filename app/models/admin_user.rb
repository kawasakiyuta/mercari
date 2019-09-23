class AdminUser < ApplicationRecord
  devise :database_aythenticatable, :omniauthable, :trackable, :validatable

  with_options presence: true do
    validates :email # whitelistでフィルタする場合、inclusionやformatのvalidationを追加
    validates :provider
    validates :uid, uniqueness: { scope: :provider }
  end

  # こちらは、ほぼ公式wiki通りに書いているが、パスワード認証しないなら、常時falseでよい
  # Devise override to ignore the password requirement if the user is authenticated
  def password_required?
    return false if provider.present?
    super
  end

  class << self
    def from_omniauth(auth)
      admin_user = where(email: auth.info.email).first || where(auth.slice(:provider, :uid).to_h).first || new
      admin_user.tap { |this| this.update_attributes(provider: auth.provider, uid: auth.uid, email: auth.info.email) }
    end
  end
end
