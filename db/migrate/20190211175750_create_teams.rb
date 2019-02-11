class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :city
      t.string :nickname
      t.string :win_loss
      t.string :home_win_loss
      t.string :away_win_loss
      t.float :points_for
      t.float :points_against
      t.string :streak
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
