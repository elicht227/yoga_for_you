class AddReviewCountToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :reviews_count, :integer
  end
end
