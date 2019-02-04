class AddResultToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :result, :string
  end
end
