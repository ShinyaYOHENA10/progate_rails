class User < ApplicationRecord
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    # パスワードカラムにバリデーション追加(空欄NG)
    validates :password, {presence: true}
end

# ﾕｰｻﾞに紐づく全投稿取得のためwhereﾒｿｯﾄﾞを使用
# find_byでは1件ずつ取得となる　selfはインスタンス自体を指す
def posts
    return User.where(user_id:self.id)
end