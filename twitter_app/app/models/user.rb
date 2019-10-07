class User < ApplicationRecord
    def has_secure_password
    end

    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    # パスワードカラムにバリデーション追加(空欄NG)
    # Since has_secure_password method above, line 2, has the same validation, delete it below.
    # validates :password, {presence: true}
end

# ﾕｰｻﾞに紐づく全投稿取得のためwhereﾒｿｯﾄﾞを使用
# find_byでは1件ずつ取得となる　selfはインスタンス自体を指す
def posts
    return User.where(user_id:self.id)
end