class GoodSamaritan < ActiveRecord::Base
  has_many(:child_tickets)
  # before_save(:capitalize_name)

  validates :name, :email, :phone_number, :uniqueness => true, :presence => true

  scope(:not_done, -> do
    where({:done => false})
  end)

  private
  #
  # define_method(:capitalize_name) do
  #     input_string = self.name.split(" ")
  #
  #     input_string.each() do |word|
  #       word.capitalize!()
  #     end
  #     self.name=input_string.join(" ")
  #   end
end
