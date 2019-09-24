class AddImageNameToUsers < ActiveRecord::Migration[6.0]
  # rails cで "rails g migration ファイル名"
  # change内でカラム追加
  # "rails db:migrate"でDBへ反映
  # パスワード設定を試す際はUser.newでオブジェクト作成 or find_byメソッドで既存のアカウントにパスワード代入
  def change
    add_column :users, :image_name, :string
  end
end
