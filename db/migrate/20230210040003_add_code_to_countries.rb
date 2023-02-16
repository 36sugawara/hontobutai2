class AddCodeToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :country_code, :string
  end
end
