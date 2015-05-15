class CreateJoinTableAttendings < ActiveRecord::Migration
  def change
    create_table :event_attendings do |t| 
  	  t.integer :attended_event_id, index: true, foreign_key: true
      t.integer :event_attendee_id, index: true, foreign_key: true
    end
    add_index :event_attendings, [:attended_event_id, :event_attendee_id], unique: true, :name => 'index'
  end
end
