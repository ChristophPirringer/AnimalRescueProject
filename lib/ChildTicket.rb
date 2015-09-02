class ChildTicket < ActiveRecord::Base
  # belongs_to_many(:parent_tickets)
  belongs_to(:good_samaritan)
  # before_save(:upcase_name)

  # validates :animal_type, :description, :location, :time, :posession, :sex, :news, :uniqueness => true, :presence => true

  scope(:not_done, -> do
    where({:done => false})
  end)

end
