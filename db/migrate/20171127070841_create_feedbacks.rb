class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.integer :ratable_id
      t.references :ratable_type, polymorphic: true
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
