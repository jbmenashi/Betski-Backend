class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :wager
      t.float :payout
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
