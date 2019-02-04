class AddMoreColumnsToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :away, :string
    add_column :bets, :home, :string
  end
end
