class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.references :game, foreign_key: true
      t.references :ticket, foreign_key: true
      t.float :multiplier

      t.timestamps
    end
  end
end
