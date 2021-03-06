class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    show = self.characters.map { |char| char.show.name }[0]
    char = self.characters.map {|char| char.name }[0]
    "#{char} - #{show}"
  end

end
