class ChangeCloumnsNotnullAddCountries < ActiveRecord::Migration[7.0]
  def change
    change_column :countries, :name, :string, null: false
  end
end
