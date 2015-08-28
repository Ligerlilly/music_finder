require 'spec_helper'

describe Venue do
  describe '.create' do
    it 'will not save with out a name' do
      band = Venue.create({ name: '' })
      expect(Venue.all.any?).to eq false
    end
  end
end
