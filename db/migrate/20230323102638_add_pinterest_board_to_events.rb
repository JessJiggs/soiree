class AddPinterestBoardToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :pinterest_board, :string
  end
end
