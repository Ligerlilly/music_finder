require 'spec_helper'

describe Venue do
  describe '.create' do
    it 'will not save with out a name' do
      band = Venue.create({ name: '' })
      expect(Venue.all.any?).to eq false
    end
  end

  describe '#cap_venue' do
    it 'capitalizes venue name' do
      venue = Venue.create({ name: 'moda center' })
      expect(venue.name).to eq 'Moda Center'
    end
  end
end
