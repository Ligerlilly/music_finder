require 'pry'
class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates :name, presence: true

  before_save :cap_band

  private

  def cap_band

    name_pieces = self.name.split(' ')

    name_pieces.each do |piece|
      piece.capitalize!
    end
    name = name_pieces.join('')

    self.name = name
  end
end
