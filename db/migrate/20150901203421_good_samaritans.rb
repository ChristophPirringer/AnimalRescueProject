class GoodSamaritans < ActiveRecord::Migration
  def change
    create_table(:good_samaritans) do |t|
      t.column(:name, :string)
      t.column(:email, :string)
      t.column(:phone_number, :integer)

      t.timestamps
    end
  end
end
