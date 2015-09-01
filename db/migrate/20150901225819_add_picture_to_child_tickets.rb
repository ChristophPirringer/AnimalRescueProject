class AddPictureToChildTickets < ActiveRecord::Migration
  def change
    add_column(:child_tickets, :picture, :varchar)
  end
end
