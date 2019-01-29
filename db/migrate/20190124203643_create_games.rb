class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :home_team
      t.string :away_team
      t.float :spread
      t.float :over_under
      t.datetime :date

      t.timestamps
    end
  end
end
