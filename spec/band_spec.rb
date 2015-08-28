require 'spec_helper'

describe Band do
  describe '.create' do
    it 'will not save with out a name' do
      band = Band.create({ name: '' })
      expect(Band.all.any?).to eq false
    end
  end
end
