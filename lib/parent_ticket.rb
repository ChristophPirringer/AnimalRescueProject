class ParentTicket < ActiveRecord::Base
  # has_many(:child_tickets)
  # belongs_to(:organizations)

  has_and_belongs_to_many(:shots)

  validates(:name, {:presence => true})
  before_save(:normalize_name)


  private

  define_method(:normalize_name) do
    self.name=self.name.downcase.titleize
  end
end
