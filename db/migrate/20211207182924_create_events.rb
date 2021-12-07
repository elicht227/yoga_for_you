class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.integer :teacher_id
      t.date :date
      t.time :start_time
      t.integer :duration
      t.time :end_time
      t.integer :park_id
      t.integer :category_id
      t.text :event_description

      t.timestamps
    end
  end
end
