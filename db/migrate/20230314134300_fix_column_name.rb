class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :guests, :fist_name, :first_name
  end
end
