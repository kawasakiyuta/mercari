class ChangeColumnsInAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :provider, :string
    add_column :admin_users, :uid,      :string

    add_index :admin_users, [:provider, :uid], unique: true

    # パスワード認証を廃止するため、以下は削除（共存させる場合は残す）
    remove_column :admin_users, :reset_password_token,   :string
    remove_column :admin_users, :reset_password_sent_at, :datetime
    remove_column :admin_users, :remember_sent_at,       :datetime
  end
end
