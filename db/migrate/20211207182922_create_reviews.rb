class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.float :star_rating
      t.text :review_text
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps
    end
  end
end
