class CreateShots < ActiveRecord::Migration
  def change
    create_table(:shots) do |s|
      s.column(:name, :varchar)
    end
  end
end
