class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    
    # Postモデル内にその投稿に紐付いたuserインスタンスを戻り値として返すuserメソッドを定義
    # インスタンスメソッド内ではselfはインスタンス自身を表す 
    def user
      return User.find_by(id: self.user_id)
    end
    
  end
  