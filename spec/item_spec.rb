require './lib/item'

describe Item do
  subject(:item) { described_class.new('Elixir of the Mongoose', 5, 7) }

  describe '#initialize' do
    it 'should contain name' do
      expect(item.name).to eq 'Elixir of the Mongoose'
    end

    it 'should contain sell in' do
      expect(item.sell_in).to eq 5
    end

    it 'should contain quality' do
      expect(item.quality).to eq 7
    end
  end
end
