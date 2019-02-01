class AddTypeToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :variety, :string
  end
end
