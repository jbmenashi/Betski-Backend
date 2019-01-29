class AddSportToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :sport, :string
  end
end
