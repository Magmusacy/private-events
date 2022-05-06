class ChangeEventDateToEventInEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :event_date
    add_column :events, :date, :string
  end
end
