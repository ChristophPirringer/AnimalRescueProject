class ChildTicket < ActiveRecord::Migration
  def change
    create_table(:child_ticket) do |t|
      t.column(:animal_type, :string)
      t.column(:description, :string)
      t.column(:location, :string)
      t.column(:time, :timestamp)
      t.column(:posession, :boolean)
      t.column(:sex, :string)
      t.column(:update, :boolean)
      t.column(:good_samaritan_id, :integer)
      t.column(:parent_ticket_id, :integer)

      t.timestamps
  end
end
end
