class ChangePosessionTableName < ActiveRecord::Migration
  def change

    rename_column :child_tickets, :posession, :possession
  end
end
