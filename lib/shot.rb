class Shot < ActiveRecord::Base
  has_and_belongs_to_many(:parent_tickets)

  validates(:name, {:presence => true})
  before_save(:normalize_name)


  private

  define_method(:normalize_name) do
    correct_name = name.split
    correct_name.each do |word|
      word.downcase!
      word.capitalize!
    end
    self.name = correct_name.join(" ")
  end
end
