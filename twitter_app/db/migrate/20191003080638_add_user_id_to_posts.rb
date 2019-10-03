class AddUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user_id, :integer
  end
end

# カラムを追加後rails c でdb:migrateでDBへ反映