class AddLogoToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :home_logo, :string
    add_column :games, :away_logo, :string
  end
end
