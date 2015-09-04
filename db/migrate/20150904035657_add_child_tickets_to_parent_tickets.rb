class AddChildTicketsToParentTickets < ActiveRecord::Migration
  def change
    add_column :parent_tickets, :child_ticket, :int
  end
end
