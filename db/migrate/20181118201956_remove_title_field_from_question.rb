class RemoveTitleFieldFromQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :title, :string
  end
end
