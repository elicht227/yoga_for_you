class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :category_name
      t.text :category_description

      t.timestamps
    end
  end
end
