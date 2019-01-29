class CreateOdds < ActiveRecord::Migration[5.2]
  def change
    create_table :odds do |t|
      t.references :game, foreign_key: true
      t.string :line
      t.integer :home_under
      t.integer :away_over

      t.timestamps
    end
  end
end
