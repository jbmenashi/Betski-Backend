class AddColumnsToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :team, :string
    add_column :bets, :line, :float
    add_column :bets, :odds, :integer
  end
end
