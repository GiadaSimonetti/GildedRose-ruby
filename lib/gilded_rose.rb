require_relative 'item'

# this is a class for the Gilderose store
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.quality > 0 && item.quality < 50
        if item.name.include? 'Sulfuras'
          return item
        elsif item.name.include? 'Backstage passes'
          if item.sell_in < 6
            item.quality += 3
          elsif item.sell_in < 11
            item.quality += 2
          else
            item.quality += 1
          end
        elsif item.name.include? 'Aged Brie'
          item.quality += 1
        elsif (item.name.include? 'Conjured') || (item.sell_in <= 0)
          item.quality -= 2
        else item.sell_in > 0
          item.quality -= 1
        end
      else
        'Quality error'
      end
    end
  end
end
