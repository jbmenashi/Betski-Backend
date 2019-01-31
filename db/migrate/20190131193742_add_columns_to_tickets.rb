class AddColumnsToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :submitted, :boolean
    add_column :tickets, :closed, :boolean
  end
end
