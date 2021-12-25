class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: 'ユーザー名'
      t.string :email, null: false, comment: 'メールアドレス'
      t.string :password_digest, null: false, comment: 'パスワード'
      t.boolean :activated, null: false, default: false, comment: 'メール認証フラグ'
      t.boolean :admin, null: false, default: false, comment: '管理者フラグ'
      t.timestamps
    end
  end
end
