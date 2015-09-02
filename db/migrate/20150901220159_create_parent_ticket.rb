class CreateParentTicket < ActiveRecord::Migration
  def change
    create_table(:parent_tickets) do |n|
      n.column(:name, :string)
      n.column(:organization_id, :int)
      n.column(:sterilized, :boolean)
      n.column(:adoption_ready, :boolean)
      n.column(:picture, :varchar)

      n.timestamps()
    end
  end
end
