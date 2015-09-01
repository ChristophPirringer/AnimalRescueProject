class ChildTicket < ActiveRecord::Base
  # belongs_to_many(:parent_tickets)
  belongs_to(:good_samaritan)
  # before_save(:upcase_name)

  validates :animal_type, :description, :location, :picture, :time, :possession, :sex, :update, :uniqueness => true, :presence => true

  scope(:not_done, -> do
    where({:done => false})
  end)

  # input_parameters = [:location, :description, :animal_type, :sex]
  #
  # input_parameters.each() do |parameter|
  #    parameter = parameter.capitalize()
  #  end
  #
  # private
  #
  # define_method(:capitalize) do
  #     input_string = self.name.split(" ")
  #
  #     input_string.each() do |word|
  #       word.capitalize!()
  #     end
  #     self.name=input_string.join(" ")
  #   end

end
