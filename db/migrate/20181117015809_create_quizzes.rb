class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :difficulty
      t.integer :points
      t.text :description

      t.timestamps
    end
  end
end
