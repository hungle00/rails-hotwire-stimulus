class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
