require 'spec_helper'

describe Band do
  describe '.create' do
    it 'will not save with out a name' do
      band = Band.create({ name: '' })
      expect(Band.all.any?).to eq false
    end
  end

  describe '#cap_band' do
    it 'capitalizes band name' do
      band = Band.create({ name: 'rage' })
      expect(band.name).to eq 'Rage'
    end
  end
end
