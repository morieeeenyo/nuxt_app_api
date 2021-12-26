class User < ApplicationRecord
  # bcryptの機能でパスワード暗号化してくれる
  # 保存先はpassword_digest
  # password, password_confirmationでパスワード判定
  # authenticateメソッドでパスワードの一致判定を行うことができる

  has_secure_password

  # validates
  validates :name, presence: true, length: { maximum: 30, allow_nil: true }

  VALID_EMAIL_REGEX = /\A\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\z/.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: { scope: :activated } # ステータスの有効・無効に対してemailは一意

  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/.freeze # 半角英数もしくは-_
  validates :password, presence: true,
                       length: { minimum: 8 },
                       format: {
                         with: VALID_PASSWORD_REGEX,
                         message: :invalid_password
                       },
                       allow_nil: true

  before_validation :downcase_email

  private

  # email小文字化
  def downcase_email
    self.email.downcase! if email
  end

end
