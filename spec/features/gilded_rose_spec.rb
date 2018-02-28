require './lib/gilded_rose'
require './lib/item'

describe GildedRose do
  describe '#update_quality' do
    it 'raises error when quality is less than 0 or more than 50'do
      items = [Item.new('Parmesan', 15, -1)]
      gilded_rose = GildedRose.new(items)
      expect(gilded_rose.update_quality).to eq 'Quality error'
    end

    it 'degrades in quality twice id SellIn is less than 0' do
      items = [Item.new('Elixir of the Mongoose', -1, 7)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 5
    end

    it 'as normal items, degrades 1 in quality' do
      items = [Item.new('Elixir of the Mongoose', 5, 7)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 6
    end

    it 'does not change quality' do
      items = [Item.new('Sulfuras', 3, 6)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 6
    end

    it 'increases quality by 1 when there are more than 10 days remaining' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 21
    end

    it 'increases quality by 2 when there are less than 10 days remaining' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 51
    end

    it 'increases quality by 2 when there are less than 5 days remaining' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 52
    end

    it 'does not change quality' do
      items = [Item.new('Aged Brie', 2, 0)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 1
    end

    it 'increases in quality the older it gets' do
      items = [Item.new('Aged Brie', 2, 0)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(items[0].quality).to eq 1
    end

    it 'degrades in quality twice as fast as normal items' do
        items = [Item.new('Conjured Mana Cake', 3, 4)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality
        expect(items[0].quality).to eq 2
      end
  end
end
