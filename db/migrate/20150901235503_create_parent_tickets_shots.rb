class CreateParentTicketsShots < ActiveRecord::Migration
  def change
    create_table(:shots_parent_tickets) do |s|
      s.column(:parent_ticket_id, :int)
      s.column(:shot_id, :int)
    end
  end
end
