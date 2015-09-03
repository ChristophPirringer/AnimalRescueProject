class AddWebsiteTableToOrganizations < ActiveRecord::Migration
  def change

    add_column :organizations, :website, :varchar
  end
end
