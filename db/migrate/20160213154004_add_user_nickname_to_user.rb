class AddUserNicknameToUser < ActiveRecord::Migration
  def change
    add_column(:users, :user_nickname, :string, :unique => true)
  end
end
