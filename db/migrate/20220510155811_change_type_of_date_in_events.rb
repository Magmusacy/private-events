class ChangeTypeOfDateInEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :date
    add_column :events, :date, :date
  end
end
