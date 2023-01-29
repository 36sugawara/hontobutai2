class AddBodyToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :body, :text, null: false
  end
end
