class User < ApplicationRecord
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    # パスワードカラムにバリデーション追加(空欄NG)
    validates :password, {presence: true}
end
