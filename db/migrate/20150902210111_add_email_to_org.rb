class AddEmailToOrg < ActiveRecord::Migration
  def change
    add_column(:organizations, :email, :varchar)
  end
end
