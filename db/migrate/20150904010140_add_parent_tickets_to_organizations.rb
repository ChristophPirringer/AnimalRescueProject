class AddParentTicketsToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :parent_ticket_id, :int
  end
end
