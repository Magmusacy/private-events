class RenameEventUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :event_users, :event_attendings
  end
end
