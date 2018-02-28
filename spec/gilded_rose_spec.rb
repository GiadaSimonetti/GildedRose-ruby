require './lib/gilded_rose'

describe GildedRose do
  items = [Item.new('foo', 0, 0)]
  gilded_rose = GildedRose.new(items)
  describe '#update_quality' do
    it 'does not change the name' do
      gilded_rose.update_quality
      expect(items[0].name).to eq 'foo'
    end
  end
end
