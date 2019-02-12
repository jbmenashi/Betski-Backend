class AddLastTenToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :last_ten, :string
  end
end
