class AddNicknameToUser < ActiveRecord::Migration
  def change
    add_column(:users, :usernick, :string, :unique => true)
  end
end
