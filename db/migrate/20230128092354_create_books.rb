class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :book_image
      t.text :info_link
      t.string :published_date
      t.references :country, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
