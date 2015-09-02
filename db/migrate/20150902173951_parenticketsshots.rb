class Parenticketsshots < ActiveRecord::Migration
  def change

    rename_table :shots_parent_tickets, :parent_tickets_shots
  end
end
