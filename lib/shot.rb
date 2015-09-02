class Shot < ActiveRecord::Base
  has_and_belongs_to_many(:parent_tickets)

  validates(:name, {:presence => true})
  before_save(:normalize_name)


  private

  define_method(:normalize_name) do
    self.name=self.name.downcase.titleize
  end
end
