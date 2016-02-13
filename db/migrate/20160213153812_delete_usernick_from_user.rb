class DeleteUsernickFromUser < ActiveRecord::Migration
  def change
    remove_column(:users, :usernick)
  end
end
