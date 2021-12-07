class AddWrittenReviewCountToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :written_reviews_count, :integer
  end
end
