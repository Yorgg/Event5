class CreateEventAttendings < ActiveRecord::Migration
  def change
    create_table :event_attendings do |t|

      t.timestamps null: false
    end
  end
end
