class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates :name, presence: true

  before_save :cap_venue

  private

  def cap_venue
    name_pieces = self.name.split(' ')
    name_pieces.each do |piece|
      piece.capitalize!
    end
    name = name_pieces.join(' ')
    self.name = name
  end
end
