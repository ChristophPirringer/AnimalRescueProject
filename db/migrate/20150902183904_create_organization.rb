class CreateOrganization < ActiveRecord::Migration
  def change
    create_table(:organizations) do |o|
      o.column(:name, :varchar)
      o.column(:address, :varchar)
      o.column(:phone, :integer)
      o.column(:social, :varchar)
      o.column(:contact_name, :varchar)
      o.column(:hours, :varchar)
      o.column(:mission_statement, :varchar)
    end
  end
end
