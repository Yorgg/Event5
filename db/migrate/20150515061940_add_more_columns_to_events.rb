class AddMoreColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :address, :string
    add_column :events, :starts_at, :date, index: true
    add_column :events, :time, :string 
  end
end
