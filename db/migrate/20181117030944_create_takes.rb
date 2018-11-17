class CreateTakes < ActiveRecord::Migration[5.2]
  def change
    create_table :takes do |t|
      t.references :quiz, foreign_key: true
      t.integer :attempts
      t.integer :score

      t.timestamps
    end
  end
end
