class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates :name, presence: true

  before_save :cap_band

  private

  def cap_band
    self.name.capitalize!
  end
end
