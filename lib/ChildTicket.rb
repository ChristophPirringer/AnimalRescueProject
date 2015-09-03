class ChildTicket < ActiveRecord::Base
  belongs_to(:parent_ticket)
  belongs_to(:good_samaritan)
  # before_save(:upcase_name)

  validates :animal_type, :description, :location, :time, :sex, :presence => true

  scope(:not_done, -> do
    where({:done => false})
  end)

end
