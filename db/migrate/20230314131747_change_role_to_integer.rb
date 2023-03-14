class ChangeRoleToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column(:collaborations, :role, 'integer USING CAST( role AS integer)')
  end
end
