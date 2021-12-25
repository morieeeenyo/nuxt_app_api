class User < ApplicationRecord
  # bcryptの機能でパスワード暗号化してくれる
  # 保存先はpassword_digest
  # password, password_confirmationでパスワード判定
  # authenticateメソッドでパスワードの一致判定を行うことができる

  has_secure_password

  # validates
  validates :name, presence: true, length: { maximum: 30, allow_nil: true }

  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/.freeze # 半角英数もしくは-_
  validates :password, presence: true,
                       length: { minimum: 8 },
                       format: {
                         with: VALID_PASSWORD_REGEX,
                         message: :invalid_password
                       },
                       allow_nil: true
end
