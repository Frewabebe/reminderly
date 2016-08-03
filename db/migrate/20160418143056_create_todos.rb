class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :body
      t.string :author_first_name
      t.string :author_last_name

      t.timestamps null: false
    end
  end
end
