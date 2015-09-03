class Organization < ActiveRecord::Base
  has_many(:parent_tickets)
  has_many(:child_tickets)
  has_many(:samaritans)

  validates :name, :address, :email, :phone, :contact_name, :address, :website, :presence => true, :uniqueness => true
  before_save(:normalize_name)
  before_save(:normalize_contact)

  # validates :phone, numericality: {only_integer: true}
  # validates :phone, length: {is: 10}

  # validates :mission_statement, length: {maximum: 500}

  private

  define_method(:normalize_name) do
    correct_name = name.split
    correct_name.each do |word|
      word.downcase!
      word.capitalize!
    end
    self.name = correct_name.join(" ")
  end

  define_method(:normalize_contact) do
    correct_contact = contact_name.split
    correct_contact.each do |word|
      word.downcase!
      word.capitalize!
    end
    self.contact_name = correct_contact.join(" ")
  end
end
